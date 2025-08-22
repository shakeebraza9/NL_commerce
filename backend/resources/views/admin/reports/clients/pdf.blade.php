<!DOCTYPE html>
<html>
<head>
    <title>Orders Report</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
        }
        th, td {
            border: 1px solid #333;
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h3>Orders Report</h3>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Customer</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Order Status</th>
                <th>Payment Method</th>
                <th>Payment Status</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
        @foreach($orders as $order)
            <tr>
                <td>{{ $order->id }}</td>
                <td>{{ $order->created_at->format('Y-m-d') }}</td>
                <td>{{ $order->customer_name }}</td>
                <td>{{ $order->customer_email }}</td>
                <td>{{ $order->customer_phone }}</td>
                <td>{{ $order->address }}</td>
               <td>{{ $order->order_status }}</td>
<td>
    {{ $order->payment_method == 1 ? 'Cash on Delivery' : 'Online' }}
</td>

                <td>{{ $order->payment_status }}</td>
                <td>PKR {{ $order->grandtotal }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</body>
</html>
