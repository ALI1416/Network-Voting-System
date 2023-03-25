function page_ctrl(current_page, total_page) {
	var obj_box = "#toPage";
	if (total_page < 2) {
		return;
	}
	$(obj_box).append('<div class="page_ctrl"></div>');

	/*打印页码开始*/
	function page_even() {
		var append_html = '<button class="prev_page">上一页</button>';

		/*打印页码数字开始*/
		var i;
		if (total_page <= 9) { //<=9页
			for (i = 0; i < total_page; i++) { //全部打印
				if (i !== current_page - 1) {
					append_html += '<button class="page_num">' + (i + 1) + '</button>';
				} else {
					append_html += '<button class="page_num current_page">' + (i + 1) + '</button>';
				}
			}
		} else { //>9页
			if (current_page <= 4) { //当前页<=4
				for (i = 0; i < 7; i++) { //打印前7页
					if (i !== current_page - 1) {
						append_html += '<button class="page_num">' + (i + 1) + '</button>';
					} else {
						append_html += '<button class="page_num current_page">' + (i + 1) + '</button>';
					}
				}
				append_html += '<span class="page_dot">•••</span>';
				append_html += '<button class="page_num">' + total_page + '</button>';
			} else if (current_page >= 5 && current_page <= total_page - 5) { //当前页5到n-5页
				append_html += '<button class="page_num">' + 1 + '</button>';
				append_html += '<span class="page_dot">•••</span>';
				for (i = current_page - 3; i < current_page + 2; i++) { //打印当前页的前后2页
					if (i !== current_page - 1) {
						append_html += '<button class="page_num">' + (i + 1) + '</button>';
					} else {
						append_html += '<button class="page_num current_page">' + (i + 1) + '</button>';
					}
				}
				append_html += '<span class="page_dot">•••</span>';
				append_html += '<button class="page_num">' + total_page + '</button>';
			} else { //当前页>=n-6页
				append_html += '<button class="page_num">' + 1 + '</button>';
				append_html += '<span class="page_dot">•••</span>';
				for (i = total_page - 7; i < total_page; i++) { //打印后7页
					if (i !== current_page - 1) {
						append_html += '<button class="page_num">' + (i + 1) + '</button>';
					} else {
						append_html += '<button class="page_num current_page">' + (i + 1) + '</button>';
					}
				}
			}
		}
		/*打印页码数字结束*/

		append_html += '<button class="next_page">下一页</button><span class="page_total">第</span><input class="input_page_num" type="text" value=""><span class="page_text">页</span><button class="to_page_num">确定</button>';
		$(obj_box).children('.page_ctrl').append(append_html);
		if (current_page === 1) {
			$(obj_box + ' .page_ctrl .prev_page').attr('disabled', 'disabled').addClass('btn_dis');
		} else {
			$(obj_box + ' .page_ctrl .prev_page').removeAttr('disabled').removeClass('btn_dis');
		}
		if (current_page === total_page) {
			$(obj_box + ' .page_ctrl .next_page').attr('disabled', 'disabled').addClass('btn_dis');
		} else {
			$(obj_box + ' .page_ctrl .next_page').removeAttr('disabled').removeClass('btn_dis');
		}
	}
	/*打印页码结束*/

	page_even();

	/*添加点击状态开始*/
	$(obj_box + ' .page_ctrl').on('click', 'button', function() {
		var that = $(this);
		if (that.hasClass('prev_page')) {
			current_page = parseInt($('.page_ctrl').find('.current_page').html());
			window.location.href = "?page=" + (current_page - 1);
		} else if (that.hasClass('next_page')) {
			current_page = parseInt($('.page_ctrl').find('.current_page').html());
			window.location.href = "?page=" + (current_page + 1);
		} else if (that.hasClass('page_num') && !that.hasClass('current_page')) {
			current_page = parseInt(that.html());
			window.location.href = "?page=" + current_page;
		} else if (that.hasClass('to_page_num')) {
			current_page = parseInt(that.siblings('.input_page_num').val());
			var reg = /^[1-9]+[0-9]*]*$/;
			if (reg.test(current_page) && current_page <= total_page) {
				window.location.href = "?page=" + current_page;
			} else {
				alert("页码错误！");
			}
		}
	});
	/*添加点击状态结束*/

}