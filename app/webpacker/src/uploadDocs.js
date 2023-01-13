

const upload_input = document.getElementsByClassName("upload-input")[0];
const upload_files_button = document.getElementsByClassName("upload-files-button")[0];
const continue_button = document.getElementsByClassName("upload-continue-button")[0];

if (upload_input && continue_button && upload_files_button) {
    upload_input.addEventListener('change', (e) => {
        if (continue_button) {
            continue_button.disabled = true;
        }
        upload_input.form.submit();
        upload_input.disabled = true;
    });

    upload_files_button.style.display = "none";
}

