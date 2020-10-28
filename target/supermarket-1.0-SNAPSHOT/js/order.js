window.onload = function () {
  new Vue({
    el:'.container',
    data: {
      items: [{ title: '订单号', product:'商品',sum:'数量',price:'单价',allPrice:'总价'}]
    }
  })
}