<?php

namespace App\Exports;

use App\Models\Order;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class OrdersExport implements FromView
{
    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function view(): View
    {
        $query = Order::query();

        if ($this->request->name) {
            $query->where('customer_name', 'like', '%' . $this->request->name . '%');
        }
        if ($this->request->email) {
            $query->where('customer_email', $this->request->email);
        }
        if ($this->request->phone) {
            $query->where('customer_phone', 'like', '%' . $this->request->phone . '%');
        }
        if ($this->request->address) {
            $query->where('address', 'like', '%' . $this->request->address . '%');
        }
        if ($this->request->orderNumber) {
            $query->where('id', $this->request->orderNumber);
        }
        if ($this->request->totalAmount) {
            $query->where('grandtotal', 'like', '%' . $this->request->totalAmount . '%');
        }
        if ($this->request->startDate && $this->request->endDate) {
            $query->whereBetween('created_at', [$this->request->startDate, $this->request->endDate]);
        }
        if ($this->request->paymentMethod) {
            $query->where('payment_method', 'like', '%' . $this->request->paymentMethod . '%');
        }
        if ($this->request->orderStatus) {
            $query->where('order_status', $this->request->orderStatus);
        }
        if ($this->request->paymentStatus) {
            $query->where('payment_status', $this->request->paymentStatus);
        }

        $orders = $query->orderBy('id', 'desc')->get();

        return view('admin.reports.clients.excel', [
            'orders' => $orders
        ]);
    }
}
