<style>
    .brand-image-wrapper {
    width: 170px;
    height: 170px;
    overflow: hidden;
    border: 2px solid #ddd;
    border-radius: 50%;
    transition: all 0.3s ease;
}
</style>


<div class="brand-slider-section py-5 bg-light">
    <div class="container">
        <h3 class="mb-4 text-center">Top Brands</h3>
        <div class="brand-slider"> {{-- Slick will use this --}}
            @foreach($brands as $brand)
                <div class="item text-center">
                    <a href="#" class="brand-box d-block">
                        <div class="brand-image-wrapper mb-2 mx-auto">
                            @if($brand->image_id)
                                <img src="{{ asset($brand->image_id) }}"
                                     alt="{{ $brand->title }}"
                                     class="img-fluid rounded-circle brand-image">
                            @else
                                <img src="{{ asset('default-brand.png') }}"
                                     alt="{{ $brand->title }}"
                                     class="img-fluid rounded-circle brand-image">
                            @endif
                        </div>
                        <h6 class="brand-title">{{ $brand->title }}</h6>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
</div>
