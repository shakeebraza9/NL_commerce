<section class="card">
    <header class="card-header bg-info">
        <h4 class="mb-0 text-white">Select brand</h4>
    </header>
    <div class="card-body">
        <div class="form-group">
            <select class="form-control" name="brand_id">
                @foreach($brands as $brand)
                    <option value="{{ $brand->id }}" @if($product->brand_id == $brand->id) selected @endif>{{ $brand->title }}</option>
                @endforeach
            </select>
            @if($errors->has('brand_id'))
                <p class="invalid-feedback">{{ $errors->first('brand_id') }}</p>
            @endif
        </div>
    </div>
</section>
