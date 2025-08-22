<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Backup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\URL;
use Illuminate\Validation\Rule;
use Laravel\Ui\Presets\React;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Carbon\Carbon;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class BackupController extends Controller
{

public function index(Request $request)
{
    if ($request->ajax()) {
        $query = Backup::query();

        // Search
        $search = $request->get('search')['value'] ?? '';
        if (!empty($search)) {
            $query->where(function ($q) use ($search) {
                $q->where('id', 'like', "%$search%")
                  ->orWhere('created_at', 'like', "%$search%");
            });
        }

        $count = $query->count();

        $records = $query->skip($request->start)
            ->take($request->length)
            ->get();

        $data = [];

        foreach ($records as $key => $value) {


$date =Carbon::parse($value->backup_date)->format('Y-m-d');
$time = Carbon::parse($value->backup_time)->format('H:i:s');
            $action = '<div class="btn-group">';
            $action .= '<a class="btn btn-danger" href="' . URL::to('admin/backup/delete/' . $value->id) . '">Delete</a>';
            $action .= '</div>';

            $data[] = [
                $value->id,
                $date,
                $time,
                $action,
            ];
        }

        return response()->json([
            "draw" => $request->draw,
            "recordsTotal" => $count,
            "recordsFiltered" => $count,
            'data' => $data,
        ]);
    }

    return view('admin.backup.index');
}


public function download()
{
    $tables = DB::select('SHOW TABLES');
    $dbName = env('DB_DATABASE');
    $tableKey = "Tables_in_{$dbName}";

    $sql = "SET FOREIGN_KEY_CHECKS=0;\n\n";

    foreach ($tables as $tableObj) {
        $table = $tableObj->$tableKey;

        $createTable = DB::select("SHOW CREATE TABLE `$table`")[0]->{'Create Table'};
        $sql .= "-- Table structure for `$table`\n";
        $sql .= "DROP TABLE IF EXISTS `$table`;\n";
        $sql .= $createTable . ";\n\n";

        $rows = DB::table($table)->get();

        if ($rows->count()) {
            $sql .= "-- Dumping data for `$table`\n";
            foreach ($rows as $row) {
                $values = array_map(function ($value) {
                    return isset($value) ? "'" . addslashes($value) . "'" : 'NULL';
                }, (array) $row);

                $sql .= "INSERT INTO `$table` VALUES(" . implode(',', $values) . ");\n";
            }
            $sql .= "\n";
        }
    }

    $sql .= "SET FOREIGN_KEY_CHECKS=1;\n";

    $timestamp = Carbon::now('Asia/Karachi')->format('Y_m_d_His');
    $fileName = "{$dbName}_backup_{$timestamp}.sql";
    $filePath = storage_path("app/{$fileName}");

    File::put($filePath, $sql);

    // ✅ Save backup record to database
    Backup::create([
        'action'       => 'Database Backup',
        'backlog'      => "Backup file created: {$fileName}",
        'backup_date'  => Carbon::now('Asia/Karachi')->toDateString(),
        'backup_time'  => Carbon::now('Asia/Karachi')->toTimeString(),
    ]);

    return response()->download($filePath)->deleteFileAfterSend(true);
}


public function delete($id)
{
    $backup = Backup::find($id);

    if (!$backup) {
        return redirect()->back()->with('error', 'Backup not found.');
    }

    $backup->delete();

    return redirect()->back()->with('success', 'Backup deleted successfully.');
}






}
