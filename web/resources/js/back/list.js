/**
 * 调用后台批量删除方法
 */
function deleteBatch(basePath) {
	$("#mainForm").attr("action",basePath + "DeleteBatchServlet.action");
	$("#mainForm").submit();
}

/**
 * 调用后台单独删除方法
 */
function deleteOne() {
	if (!confirm("确认要删除？")) {
		window.event.returnValue = false;
	}
}

/**
 * 修改当前页码，调用后台重新查询
 */
function changeCurrentPage(currentPage) {
	$("#currentPage").val(currentPage);
	$("#mainForm").submit();
}