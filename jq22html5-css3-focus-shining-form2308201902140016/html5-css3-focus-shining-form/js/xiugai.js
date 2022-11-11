'use strict';

var placeholders = document.querySelectorAll('.styled-input__placeholder-text'),
    inputs = document.querySelectorAll('.styled-input__input');

placeholders.forEach(function (el, i) {
    var value = el.innerText,
        html = '';
    for (var _iterator = value, _isArray = Array.isArray(_iterator), _i = 0, _iterator = _isArray ? _iterator : _iterator[Symbol.iterator]();;) {
        var _ref;

        if (_isArray) {
            if (_i >= _iterator.length) break;
            _ref = _iterator[_i++];
        } else {
            _i = _iterator.next();
            if (_i.done) break;
            _ref = _i.value;
        }

        var w = _ref;

        if (!value) value = '&nbsp;';
        html += '<span class="letter">' + w + '</span>';
    }
    el.innerHTML = html;
});

inputs.forEach(function (el) {
    var parent = el.parentNode;
    el.addEventListener('focus', function () {
        parent.classList.add('filled');
        placeholderAnimationIn(parent, true);
    }, false);
    el.addEventListener('blur', function () {
        if (el.value.length) return;
        parent.classList.remove('filled');
        placeholderAnimationIn(parent, false);
    }, false);
});

function placeholderAnimationIn(parent, action) {
    var act = action ? 'add' : 'remove';
    var letters = parent.querySelectorAll('.letter');
    letters = [].slice.call(letters, 0);
    if (!action) letters = letters.reverse();
    letters.forEach(function (el, i) {
        setTimeout(function () {
            var contains = parent.classList.contains('filled');
            if (action && !contains || !action && contains) return;
            el.classList[act]('active');
        }, 50 * i);
    });
}

setTimeout(function () {
    document.body.classList.add('on-start');
}, 100);

setTimeout(function () {
    document.body.classList.add('document-loaded');
}, 1800);










$(".styled-button").click(function(){
    upData()
    getUserInfo() 

})

function upData(){

    $.ajax({
        type:"PATCH",
        url:"http://120.48.109.174:8081/user",
        async:true,
        headers: {
            'authorization':localStorage.getItem('token')
        },
        data:{
            'nickname':$(".nickname").val(),
            'gender':$("[type=radio]:checked").val(),
            },
        success:function(res){
            console.log(res)
        }
    
    });

}    




function getUserInfo() {
    $.ajax({
        type: "get",
        url: "http://120.48.109.174:8081/user",
        async: true,
        headers: {
            'authorization': localStorage.getItem('token')
        },
        success: function(res) {
            $('h1').html(res.body.nickname)
            if(res.body.gender == '1'){
                res.body.gender = '男'
                $('h2').html(res.body.gender)
            }else {
                res.body.gender = '女'
                $('h2').html(res.body.gender)

            }
            console.log(res)
        }
    });
}


