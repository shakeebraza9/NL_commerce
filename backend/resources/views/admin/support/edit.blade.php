<div id="popupFormContainer">
    <div class="row">
        <button id="closePopupBtnn" type="button" class="btn-close" aria-label="Close"></button>
        <div class="col-lg-12">
            <section class="card">
                <header class="card-header bg-info">
                    <h4 class="mb-0 text-white">Add New File Form</h4>
                </header>
                <div id="jsonDisplay"></div>
                <div id="error-message" style="color: red; display: none;">All fields are required!</div>
                <div class="card-body">
                    <form id="replyForm" action="{{ URL::to('/admin/support/reply') }}" method="POST">
    @csrf
    <div class="container">

        <!-- Hidden field for support_id -->
        <input type="hidden" name="support_id" id="popupSupportId">

        <!-- Message (readonly) -->
        <div class="my-2 row">
            <div class="col-md-12">
                <label class="form-label">Message</label>
                <textarea id="popupMessage" class="form-control" readonly></textarea>
            </div>
        </div>

        <!-- Reply (user input) -->
        <div class="my-2 row">
            <div class="col-md-12">
                <label class="form-label">Reply</label>
                <textarea name="reply" id="popupReply" class="form-control" placeholder="Type your reply..." required></textarea>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="row">
            <div class="col-md-12 pt-3">
                <button type="submit" id="btn-submit-reply" class="btn btn-primary text-white position-relative">
                    Send Reply
                    <div id="loader" class="position-absolute top-50 start-50 translate-middle" style="display: none;">
                        <div class="spinner-border text-light" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </button>
            </div>
        </div>
    </div>
</form>

                </div>
            </section>
        </div>
    </div>
</div>
