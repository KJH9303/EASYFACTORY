$(document).ready(function() {
    // 파일 입력 변경 핸들러
    $('#file-input').on('change', function() {
        const preview = $('#preview');
        const files = Array.from($('#file-input')[0].files);
        files.forEach(function(file) {
            const fileId = 'file-' + file.lastModified; // 파일에 부여할 고유한 ID 생성
            preview.append('<p id="' + fileId + '">' + file.name + '<button data-index="' + fileId + '" class="file-remove">X</button></p>');
        });
    });

    // 파일 제거 핸들러
    $(document).on('click', '.file-remove', function() {
        const removeTargetId = $(this).data('index');
        const removeTarget = $('#' + removeTargetId)[0];
        const fileInput = $('#file-input')[0];
        const dataTransfer = new DataTransfer();

        for (let i = 0; i < fileInput.files.length; i++) {
            const file = fileInput.files[i];
            if ('file-' + file.lastModified != removeTargetId) {
                dataTransfer.items.add(file);
            }
        }

        fileInput.files = dataTransfer.files;
        removeTarget.remove();
    });
});