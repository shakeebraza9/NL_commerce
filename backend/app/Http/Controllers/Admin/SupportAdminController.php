<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SupportMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\URL;
use App\Events\SupportReplied;

class SupportAdminController extends Controller
{

public function index(Request $request)
{
    if ($request->ajax()) {

        $query = SupportMessage::query();

        // Search filter
        $search = $request->get('search')['value'];
        if (!empty($search)) {
            $query->where(function ($q) use ($search) {
                $q->where('ip_address', 'like', "%{$search}%")
                  ->orWhere('message', 'like', "%{$search}%")
                  ->orWhere('reply', 'like', "%{$search}%")
                  ->orWhere('status', 'like', "%{$search}%");
            });
        }

        $count = $query->count();

        $records = $query->skip($request->start)
            ->take($request->length)
            ->orderBy('id', 'desc')
            ->get();

        $data = [];
        foreach ($records as $key => $value) {
            $status = $value->status == 'answered'
                ? '<span class="badge bg-success">Answered</span>'
                : '<span class="badge bg-danger">Pending</span>';

           $action = '<div class="btn-group">
                <button class="btn btn-info btn-sm openReplyPopup"
                    data-id="'.$value->id.'"
                    data-message="'.e($value->message).'">Reply</button>
                <a class="btn btn-danger btn-sm deleteRecord" data-id="'.$value->id.'" href="javascript:void(0);">Delete</a>
            </div>';


            $data[] = [
                $value->id,
                $value->ip_address,
                $value->message,
                $value->reply,
                $status,
                $action,
            ];
        }

        return response()->json([
            "draw" => intval($request->draw),
            "recordsTotal" => $count,
            "recordsFiltered" => $count,
            'data' => $data,
        ]);
    }

    return view('admin.support.index');
}
   public function reply(Request $request)
{
    $request->validate([
        'support_id' => 'required|exists:support_messages,id',
        'reply' => 'required|string',
    ]);

    $support = SupportMessage::find($request->support_id);
    $support->reply = $request->reply;
    $support->status = 'answered';
    $support->save();

    // Broadcast event
    event(new SupportReplied($support));

    return redirect('/admin/support/index')->with('success','Reply Sent Successfully');
}

    public function delete($id)
    {
        $data = SupportMessage::find(Crypt::decryptString($id));

        if($data == false){
            return back()->with('warning','Record Not Found');
        }else{

            $data->delete();
            return redirect('/admin/sliders/index')->with('success','Record Deleted Success');
        }

    }
}
