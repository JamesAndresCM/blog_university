function RemoveMajor(major, course) {
    if (confirm("Are you sure you want to delete?"))
        $.ajax({
            url: '/universities/' + major + '/majors/' + course,
            method: 'DELETE',
            contentType: 'application/json',
            success: function (result) {
                $("#major_" + major).remove();
                $('.alert-success').html("<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success</strong> Curso eliminado").show();
            },
            error: function (request, msg, error) {
                console.log(request, msg, error);
            }
        });
    else
        return false;
}

