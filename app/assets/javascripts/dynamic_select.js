$(document).on('turbolinks:load', function() {
    $("#post_major_id").change(function () {
        var id = parseInt($(this).children(":selected").attr("value"));
        var id_user_university = parseInt($('.university_user').attr("id"));

        clearTarget();

        if (!isNaN(id)) {
            $.ajax({
                type: "GET",
                url: "/universities/" + id_user_university + "/majors/" + id + ".json",
                contentType: 'application/json',
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        if (data.length > 0) {
                            $('#post_course_id').append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
                        }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error " + jqXHR + textStatus + errorThrown);
                },
            });
        }

        function clearTarget() {
            return this.$("#post_course_id").html('<option>Seleccione Asignatura</option>');
        }
    })

});
