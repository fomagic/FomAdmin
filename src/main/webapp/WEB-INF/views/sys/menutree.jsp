<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:forEach items="${menuList }" var="menuItem">
	
		<c:if test="${menuItem.type == 0 }">
		<li class="treeview">
			<a href="javascript:;">
				<c:if test="${ not empty menuItem.icon}">
					<i class="${menuItem.icon }"></i>
				</c:if>
				<c:if test="${empty menuItem.icon }">
					<i class="fa fa-circle-o"></i>
				</c:if>
				<span>${menuItem.name }</span>
				<span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
			</a>
			<ul class="treeview-menu">
				<c:set var="menuList" value="${menuItem.list}" scope="request" />
				<c:import url="menutree.jsp"/>
			</ul>
		</c:if>
		<c:if test="${menuItem.type == 1 }">
		<li>
			<a href="${menuItem.url }" target="contentFrame" onclick="changeClick(this)">
				<c:if test="${ not empty menuItem.icon}">
					<i class="${menuItem.icon }"></i>
				</c:if>
				<c:if test="${empty menuItem.icon }">
					<i class="fa fa-circle-o"></i>
				</c:if>
				<span>${menuItem.name }</span>
			</a>
		</c:if>
	</li>
</c:forEach>