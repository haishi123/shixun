$('.sure').click(function () {
    $('.send').hide();
    var tati = $("#tati").val()
    var cont = $("#cont").val()
    var banji = $("#banji").val()
    var banji_a = $("#banji_a").val()
    var banji_b = $("#banji_b").val()
    var banji_c = $("#banji_c").val()
    var banji_d = $("#banji_d").val()
    var banji_e = $("#banji_e").val()
    var banji_f = $("#banji_f").val()

   
    // var trin = $("<li id='ctr" + tati + "'><div id='title'>" + tati + "</div><p id='content'>" + cont + "</p><button id='shanchu'>删除</button></li>");
    var trin = $("<li id='ctr'> <div id='title'>" + tati + "</div> <div id='content'>" + cont + "</div> <div id='content_a'>" + banji + "</div>  <div id='content_b'>"+banji_a +"</div><div id='content_c'>"+banji_b +"</div><div id='content_d'>"+banji_c +"</div> <div id='content_e'>"+banji_d +"</div><div id='content_f'>"+banji_e +"</div><div id='content_g'>"+banji_f +"</div><button id='shanchu'>删除</button></li>");
    if (tati != "" && cont != "") {
        $("#xia").after(trin);
    }
    console.log($('#title').text());
    console.log($('#content').text());
    console.log($('#content_a').text());

    $('#shanchu').click(function () {
        // $.ajax({
        //     type: "get",
        //     url: "http://"+api+"/delete_message",
        //     data: {
        //         "title": $('#title').text(),
        //         "content": $('#content').text()
        //     },
        //     success: function (res) {
        //         console.log(res);
        //     }
        // });
        $(this).parent().remove();
    })

    // $.ajax({
    //     type: "get",
    //     url: "http://"+api+"/message",
    //     data: {
    //         "title": $('#title').text(),
    //         "content": $('#content').text()
    //     },
    //     success: function (res) {
    //         console.log(res);
    //     }
    // });
    $("#tati").val('')
    $("#cont").val('')
    $("#banji").val('')
    $("#banji_a").val('')
    $("#banji_b").val('')
    $("#banji_c").val('')
    $("#banji_d").val('')
    $("#banji_e").val('')
    $("#banji_f").val('')
    
    
})


$('.but button').click(function () {
    $('.send').show();
})

$('.but_two .Cancel').click(function () {
    $('.send').hide();
})





