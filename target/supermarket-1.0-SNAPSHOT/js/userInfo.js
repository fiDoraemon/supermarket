function affirmUser() {
    var msg = "确认删除吗？"
    if (confirm(msg) == true){
        var deleteUser = document.getElementById("deteleUser");
        location.href = "user/remove";
            deleteUser.submit();
    }
}
function checkBoxid() {
    var select = document.getElementsByName("select[]");
    var v = 0;
    for (var i = 0 ; i<select.length;i++){
        if (select[i].checked == true){
            v++;
        }
    }
    if (v==0){
        var deletMsg = "请选择需要删除的用户！";
        alert(deletMsg);
    }else {
        affirmUser();
    }
}

function selectAllorNo() {
    var selectAll = document.getElementById("selectAllOrNot");
    if (selectAll.checked == false){
        selectAllOrNot(false);
    }else {
        selectAllOrNot(true);
    }
}
//实现全选按钮 和 全不选按钮的操作
function selectAllOrNot(bool) {
    //获取name=love 的对象集  一个name可以对应多个元素  所有没有getElementByName()这个方法
    var loves = document.getElementsByName("select[]");
    //获取id=boxid 的对象集   一个id只能对应一个元素  所有没有getElementsById()这个方法
    //var boxid = document.getElementById("selectAllOrNot");
    for (var i = 0; i < loves.length; i++) {
        loves[i].checked = bool;
    }
}