<div class="slideshow slideshow-wrapper pb-section">
    <div class="home-slideshow slideshow--large">

        @foreach ($sliders as $slide)
            <div class="slide slide1 d-block position-relative">
                <a href="{{ $slide->link }}">
                    <img
                        class="w-100"
                        src="{{ asset($slide->image_id) }}"
                        alt="{{ $slide->title }}"
                        style="height: 650px; object-fit: cover;"
                    />
                </a>

                @if ($slide->title || $slide->details || $slide->button)
                    <!-- Text Overlay -->
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center">
                        <div class="text-center px-5 py-4" style="background: rgba(0, 0, 0, 0.4); border-radius: 12px; max-width: 700px;">
                            @if ($slide->title)
                                <h2 class="display-4 fw-bold text-white mb-3" style="text-shadow: 1px 1px 5px rgba(0,0,0,0.7);">
                                    {{ $slide->title }}
                                </h2>
                            @endif
                            @if ($slide->details)
                                <p class="lead text-white mb-4" style="text-shadow: 1px 1px 3px rgba(0,0,0,0.5);">
                                    {{ $slide->details }}
                                </p>
                            @endif
                            @if ($slide->button)
                                <a href="{{ URL::to($slide->link) }}" class="btn btn-outline-light px-4 py-2 rounded-pill" style="font-weight: 500;">
                                    {{ $slide->button }}
                                </a>
                            @endif
                        </div>
                    </div>
                @endif
            </div>
        @endforeach

    </div>
</div>
