<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.grid {
	margin: 40px auto 120px;
	max-width: 1000px;
	width: 90%;
}

.grid a {
	float: left;
	max-width: 250px;
	width: 25%;
	color: #333;
}

.grid a:nth-child(odd) {
	margin: 30px 0 -30px 0;
}

.grid figure {
	position: relative;
	overflow: hidden;
	margin: 5px;
	background: #333;
}

.grid figure img {
	position: relative;
	display: block;
	width: 100%;
	opacity: 0.7;
	-webkit-transition: opacity 0.3s;
	transition: opacity 0.3s;
}

.grid figcaption {
	position: absolute;
	top: 0;
	z-index: 11;
	padding: 10px;
	width: 100%;
	height: 100%;
	text-align: center;
}

.grid figcaption h2 {
	margin: 0 0 10px 0;
	color: #3498db;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 300;
	font-size: 130%;
	-webkit-transition: -webkit-transform 0.3s;
	transition: transform 0.3s;
}

.grid figcaption p {
	padding: 0 20px;
	color: #aaa;
	font-weight: 300;
	-webkit-transition: opacity 0.3s, -webkit-transform 0.3s;
	transition: opacity 0.3s, transform 0.3s;
}

.grid figcaption h2,
.grid figcaption p {
	-webkit-transform: translateY(50px);
	transform: translateY(50px);
}


.grid figcaption,
.grid figcaption h2,
.grid figcaption p {
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

/* Style for SVG */
.grid svg {
	position: absolute;
	top: -1px; /* fixes rendering issue in FF */
	z-index: 10;
	width: 100%;
	height: 100%;
}

.grid svg path {
	fill: #fff;
}

/* Hover effects */
.grid a:hover figure img {
	opacity: 1;
}

.grid a:hover figcaption h2,
.grid a:hover figcaption p {
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

.grid a:hover figcaption p {
	opacity: 0;
}
/* Media Queries */

@media screen and (max-width: 58em) {
	.grid a {
		width: 33.333%;
	}

	.grid a:nth-child(odd) {
		margin: 0;
	}

	.grid a:nth-child(3n-1) {
		margin: 30px 0 -30px 0;
	}
}

@media screen and (max-width: 45em) {
	.grid {
		max-width: 500px;
	}

	.grid a {
		width: 50%;
	}

	.grid a:nth-child(3n-1) {
		margin: 0;
	}

	.grid a:nth-child(even) {
		margin: 30px 0 -30px 0;
	}


	.grid figcaption h2 {
		margin-bottom: 0px;
		-webkit-transform: translateY(30px);
		transform: translateY(30px);
	}

	.grid figcaption p {
		margin: 0;
		padding: 0 10px;
	}
}

@media screen and (max-width: 27em) {
	.grid {
		max-width: 250px;
	}

	.grid a {
		width: 100%;
	}

	.grid a:nth-child(even) {
		margin: 0;
	}
}
</style>


<div  style="min-height: 1000px;">
	<div align="center" width="100" style="margin-top: 100px;">
		 <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/gallery/created';">글쓰기</button>
	</div>
		
	<section id="grid" class="grid clearfix" style="min-height: 1000px;">
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User1'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User2'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
	
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User3'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User4'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User5'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User6'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User7'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		
		<a href="#" data-path-hover="m 0,0 0,47.7775 c 24.580441,3.12569 55.897012,-8.199417 90,-8.199417 34.10299,0 65.41956,11.325107 90,8.199417 L 180,0 z">
			<figure>
				<img src="${pageContext.request.contextPath}/resources/images/sample.png"/>
				<svg viewBox="0 0 180 400" preserveAspectRatio="none"><path d="m 0,0 0,171.14385 c 24.580441,15.47138 55.897012,24.75772 90,24.75772 34.10299,0 65.41956,-9.28634 90,-24.75772 L 180,0 0,0 z"/></svg>
				<figcaption>
					<h2>'User8'님의 포토 </h2>
					<p>첫번째 사진을 업로드</p>
					<p><i class="far fa-eye"></i> 1,234 </p>
				</figcaption>
			</figure>
		</a>
		   	
	</section>
		
</div>
		
	
	
	
	
 
 