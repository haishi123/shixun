
$('#pacd').click(function () {
    $('#img-upload').click();
});


$.ajax({
    type: "get",
    url: "http://" + api + "/show_portrait",
    success: function (res) {
        console.log(res)
        var str = "";
        str = `
                <img class='a' src="http://${api}/images/${res.portrait}" alt="" id="my-img">
            `
        $(".avatar_change").append(str);

        aa();
    }
})



let fm = new FormData();
$('#img-upload').change(function (e) {
    fm.append('file', e.target.files[0]);

})
function aa() {
    $('#ooo').click(function () {
        console.log(111)
        $.ajax({
            type: 'post',
            url: "http://" + api + "/change_portrait",
            caches: false,
            processData: false,
            contentType: false,
            data: fm,
            success: function (res) {
                console.log(res);

                $('.a').attr('src', `'http://${api}/images/${res}'`);

                location.reload(true)
            },
            
        });
    })
}
$('#sure_').click(function () {

    $.ajax({
        type: "get",
        url: "http://" + api + "/quit",
        success: function (res) {
            console.log(res);

            if (res == '退出成功') {
                window.location.href = "index.html"
            }
        }
    });

})

$('#queding').click(function () {

    $.ajax({
        type: "get",
        url: "http://" + api + "/save",
        data: {
            sex: $('#sex').val(),
            phone: $('#phone').val(),
            nicheng: $('#nicheng').val(),
            wechat: $('#wechat').val()
        },
        success: function (res) {
            console.log(res);
        }
    });

})




$('.Inquire #Search_').click(function(){
    $('.individual').hide();$('.examine').show();
    $.ajax({
        type: "get",
        url:"http://"+api+"/own_query",
        success: function (res) {
            console.log(res.data);
            var src = '';
            $.each(res.data,function(i,item){
                src += `
                <li>
                <div class="">${item.title}</div>
                    <p>${item.text}</p>
                    <p>${item.name},${item.date}<p>
                </li>
                `
            })
            $('#content').append(src)
        }
    });
})





$('#Search_').click(function(){
    $.ajax({
        type: "get",
        url:"http://"+api+"/own_articles",
        data:{
            search:$('.essay').val(),
        },
        success: function (res){
            console.log(res);  
            var src = '';
            
            $.each(res.data,function(i,item){
                src = `
                <li>
                    <div class="">${item.title}</div>
                        <p>${item.text}</p>
                        <p>${item.name},${item.date}<p>
                    </li>
                        `
                    })
            $('#content').empty().append(src)
        }
    });
    
    
})






