function layer_show(w, h, title, url) {
    //if (w == null || w == '') {
    //	w=800;
    //};
    //if (h == null || h == '') {
    //	h=($(window).height() - 50);
    //};
    if (title == null || title == '') {
        title = false;
    };
    if (url == null || url == '') {
        url = "404、nofound.html";
    };
    layer.open({//layer.js
        type: 2,
        shadeClose: true,
        title: title,
        maxmin: true,
        shadeClose: false,
        closeBtn: [0, true],
        shade: [0.8, '#000'],
        border: [0],
        offset: ['2', ''],
        area: [w, '100%'],
        content: url
        
    });
}



function edit_staff(w, h, title, url) {
    layer_show(w, h, title, url);
}
