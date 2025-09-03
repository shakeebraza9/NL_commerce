<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteActivity;
use GeoIP;

class WebsiteActivityController extends Controller
{
    public function track(Request $request)
    {
        $ip = $request->ip_address;

        try {
            $location = geoip()->getLocation($ip);
            $country = $location->country ?? null;
            $city = $location->city ?? null;
        } catch (\Exception $e) {
            $country = "Pakitan";
            $city = "Karachi";
        }

        WebsiteActivity::create([
            'page_name'  => $request->page_name,
            'ip_address' => $ip,
            'country'    => $country,
            'city'       => $city,
            'visited_at' => now(),
        ]);

        return response()->json([
            'message' => 'Activity tracked successfully',
            'ip'      => $ip,
            'country' => $country,
            'city'    => $city,
        ]);
    }
}
