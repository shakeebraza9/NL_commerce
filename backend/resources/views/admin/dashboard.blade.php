@extends('admin.layout')

@section('css')
    <!-- ============================================================== -->
    <!-- Page CSS -->
    <!-- ============================================================== -->
    <style>
        @import url(https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700);
        .cmin-height {
        height: 105px; }
</style>

@endsection

@section('content')

                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">Dashboard 1</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-end">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb justify-content-end">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard 1</li>
                            </ol>
                        </div>
                    </div>
                </div>

<div class="row g-0">
    <!-- Orders Card -->
    <div class="col-lg-3 col-md-6">
        <div class="card border">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-screen-desktop"></i></h3>
                                <p class="text-muted">ORDER,S</p>
                            </div>
                            <div class="ms-auto">
                                <h2 class="counter text-primary">{{ $totalOrder }}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <canvas id="orderChart" height="50"></canvas>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="progress">
                            <div class="progress-bar bg-primary" style="width: 85%; height: 6px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Collection Card -->
    <div class="col-lg-3 col-md-6">
        <div class="card border">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-note"></i></h3>
                                <p class="text-muted">COLLECTION</p>
                            </div>
                            <div class="ms-auto">
                                <h2 class="counter text-cyan">{{ $totalCollection }}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <canvas id="collectionChart" height="50"></canvas>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="progress">
                            <div class="progress-bar bg-cyan" style="width: 85%; height: 6px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Card -->
    <div class="col-lg-3 col-md-6">
        <div class="card border">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-doc"></i></h3>
                                <p class="text-muted">CATEGORY</p>
                            </div>
                            <div class="ms-auto">
                                <h2 class="counter text-purple">{{ $totalCategory }}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <canvas id="categoryChart" height="50"></canvas>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="progress">
                            <div class="progress-bar bg-purple" style="width: 85%; height: 6px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Card -->
    <div class="col-lg-3 col-md-6">
        <div class="card border">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="d-flex no-block align-items-center">
                            <div>
                                <h3><i class="icon-bag"></i></h3>
                                <p class="text-muted">PRODUCTS</p>
                            </div>
                            <div class="ms-auto">
                                <h2 class="counter text-success">{{ $totalProduct }}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-2">
                        <canvas id="productChart" height="50"></canvas>
                    </div>
                    <div class="col-12 mt-2">
                        <div class="progress">
                            <div class="progress-bar bg-success" style="width: 85%; height: 6px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="card border">
    <div class="card-body">
        <h4 class="card-title">Website Activity</h4>
        <canvas id="activityChart" height="150"></canvas>
    </div>
</div>

<div class="card border">
    <div class="card-body">
        <h4 class="card-title">Orders Overview</h4>
        <div class="mb-3">
            <button class="btn btn-sm btn-primary me-2" onclick="updateChart('day')">Daily</button>
            <button class="btn btn-sm btn-primary me-2" onclick="updateChart('month')">Monthly</button>
            <button class="btn btn-sm btn-primary" onclick="updateChart('year')">Yearly</button>
        </div>
        <canvas id="ordersChart" height="100"></canvas>
    </div>
</div>


<div class="card border">
    <div class="card-body">
        <h4 class="card-title">Top Selling Products</h4>
        <canvas id="topProductsChart" height="100"></canvas>
    </div>
</div>

@endsection
@section('js')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    function createLineChart(canvasId, color, dataValue) {
        const ctx = document.getElementById(canvasId).getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul'],
                datasets: [{
                    data: [5, 10, 8, 15, 12, 18, dataValue],
                    borderColor: color,
                    backgroundColor: color.replace('1)', '0.2)'),
                    fill: true,
                    tension: 0.4,
                    pointRadius: 0
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                scales: { x: { display: false }, y: { display: false } }
            }
        });
    }

    createLineChart('orderChart', 'rgba(0,123,255,1)', {{ $totalOrder }});
    createLineChart('collectionChart', 'rgba(23,162,184,1)', {{ $totalCollection }});
    createLineChart('categoryChart', 'rgba(111,66,193,1)', {{ $totalCategory }});
    createLineChart('productChart', 'rgba(40,167,69,1)', {{ $totalProduct }});
</script>
<script>
const ctx = document.getElementById('activityChart').getContext('2d');

const colors = [
    'rgba(54, 162, 235, 0.7)',
    'rgba(255, 99, 132, 0.7)',
    'rgba(255, 206, 86, 0.7)',
    'rgba(75, 192, 192, 0.7)',
    'rgba(153, 102, 255, 0.7)',
    'rgba(255, 159, 64, 0.7)',
    'rgba(100, 255, 218, 0.7)',
    'rgba(255, 205, 86, 0.7)',
    'rgba(201, 203, 207, 0.7)'
];

const borderColors = colors.map(c => c.replace('0.7', '1'));

const data = {
    labels: @json($pageVisits->keys()),      // Pages
    datasets: [{
        label: 'Page Visits - This Month',
        data: @json($pageVisits->values()), // Count per page
        backgroundColor: colors,
        borderColor: borderColors,
        borderWidth: 1,
        borderRadius: 5,       // Rounded bars
        barPercentage: 0.6,    // Thickness of bars
        categoryPercentage: 0.8
    }]
};

const config = {
    type: 'bar',
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },   // Hide legend for simplicity
            title: { display: true, text: 'Website Page Visits (This Month)', font: { size: 18 } },
            tooltip: { enabled: true }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: { stepSize: 1 }  // Step 1
            },
            x: {
                ticks: { font: { size: 14 } }
            }
        }
    }
};

new Chart(ctx, config);
</script>


<script>
    let chart;

    const ordersData = {
        day: @json($ordersDay),
        month: @json($ordersMonth),
        year: @json($ordersYear)
    };

    function renderChart(labels, data) {
        const ctx = document.getElementById('ordersChart').getContext('2d');
        if(chart) chart.destroy(); // destroy previous chart

        chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Orders',
                    data: data,
                    borderColor: 'rgba(0,123,255,1)',
                    backgroundColor: 'rgba(0,123,255,0.2)',
                    fill: true,
                    tension: 0.4,
                    pointRadius: 3
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false },
                    title: { display: true, text: 'Orders Overview' }
                },
                scales: {
                    x: { display: true },
                    y: { beginAtZero: true }
                }
            }
        });
    }

    function updateChart(type) {
        const data = ordersData[type];
        const labels = Object.keys(data);
        const values = Object.values(data);
        renderChart(labels, values);
    }

    // Default chart: monthly
    updateChart('month');
</script>



<script>
  const productLabels = @json($topProducts->pluck('title'));
const productData = @json($topProducts->pluck('total_sold'));

const topProductsCanvas = document.getElementById('topProductsChart'); // 👈 unique var
const gradient = topProductsCanvas.getContext('2d').createLinearGradient(0, 0, 0, 400);

gradient.addColorStop(0, 'rgba(40, 167, 69, 0.9)');
gradient.addColorStop(1, 'rgba(25, 135, 84, 0.5)');

new Chart(topProductsCanvas, { // 👈 ctx ki jagah canvas id
    type: 'bar',
    data: {
        labels: productLabels,
        datasets: [{
            label: 'Quantity Sold',
            data: productData,
            backgroundColor: gradient,
            borderColor: 'rgba(25, 135, 84, 1)',
            borderWidth: 2,
            borderRadius: 8,
            hoverBackgroundColor: 'rgba(25, 135, 84, 1)',
            hoverBorderColor: 'rgba(20, 108, 67, 1)',
            barPercentage: 0.6,
            categoryPercentage: 0.7
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { display: false },
            title: {
                display: true,
                text: 'Top Selling Products',
                font: { size: 20, weight: 'bold' },
                color: '#28a745'
            },
            tooltip: {
                backgroundColor: '#198754',
                titleColor: '#fff',
                bodyColor: '#fff',
                borderColor: '#14532d',
                borderWidth: 1,
                padding: 10,
                displayColors: false
            }
        },
        scales: {
            x: {
                ticks: {
                    color: '#198754',
                    font: { weight: '600' }
                },
                grid: {
                    drawBorder: false,
                    color: 'rgba(0,0,0,0.05)'
                }
            },
            y: {
                beginAtZero: true,
                ticks: {
                    color: '#198754',
                    font: { weight: '600' }
                },
                grid: {
                    drawBorder: false,
                    color: 'rgba(0,0,0,0.05)'
                }
            }
        }
    }
});

</script>



@endsection
