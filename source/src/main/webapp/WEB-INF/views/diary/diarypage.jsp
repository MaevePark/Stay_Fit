<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/calendar/lib/main.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/calendar/lib/calendar.css"
	type="text/css">

<section>
	<div id="calendar"
		class="fc fc-media-screen fc-direction-ltr fc-theme-standard">
		<div class="fc-header-toolvar fc-toolbar fc-toolbar fc-tollbar-ltr">
			<div class="fc-toolbar-chunk">
				<div class="fc-button-group">
					<button type="button" title="Previous month" aria-pressed="false"
						class="fc-prev-button fc-button fc-button-primary">
						<span class="fc-icon fc-icon-chevron-left"></span>
					</button>
					<button type="button" title="Next month" aria-pressed="false"
						class="fc-next-button fc-button fc-button-primary">
						<span class="fc-icon fc-icon-chevron-right"></span>
					</button>
				</div>
				<button type="button" title="This month" aria-pressed="false"
					class="fc-today-button fc-button fc-button-primary">오늘</button>
			</div>
			<div class="fc-toolbar-chunk">
				<h2 class="fc-toolbar-title" id="fc-dom-1">September 2020</h2>
			</div>
			<div class="fc-toolbar-chunk">
				<div class="fc-button-group">
					<button type="button" title="month view" aria-pressed="true"
						class="fc-dayGridMonth-button fc-button fc-button-primary fc-button-active">month</button>
					<button type="button" title="list view" aria-pressed="false"
						class="fc-listYear-button fc-button fc-button-primary">list</button>
				</div>
			</div>
		</div>
		<div aria-labelledby="fc-dom-1"
			class="fc-view-harness fc-view-harness-active"
			style="height: 565.185px;">
			<div class="fc-daygrid fc-dayGridMonth-view fc-view">
				<table role="grid" class="fc-scrollgrid  fc-scrollgrid-liquid">
					<thead role="rowgroup">
						<tr role="presentation"
							class="fc-scrollgrid-section fc-scrollgrid-section-header ">
							<th role="presentation">
								<div class="fc-scroller-harness">
									<div class="fc-scroller" style="overflow: hidden;">
										<table role="presentation" class="fc-col-header "
											style="width: 761px;">
											<colgroup>
											</colgroup>
											<thead role="presentation">
												<tr role="row">
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-sun">
														<div class="fc-scrollgrid-sync-inner">
															<a aria-label="Sunday"
																class="fc-col-header-cell-cushion ">Sun</a>
														</div>
													</th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-mon"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Monday"
																class="fc-col-header-cell-cushion ">Mon</a>
														</div></th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-tue"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Tuesday"
																class="fc-col-header-cell-cushion ">Tue</a>
														</div></th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-wed"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Wednesday"
																class="fc-col-header-cell-cushion ">Wed</a>
														</div></th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-thu"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Thursday"
																class="fc-col-header-cell-cushion ">Thu</a>
														</div></th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-fri"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Friday"
																class="fc-col-header-cell-cushion ">Fri</a>
														</div></th>
													<th role="columnheader"
														class="fc-col-header-cell fc-day fc-day-sat"><div
															class="fc-scrollgrid-sync-inner">
															<a aria-label="Saturday"
																class="fc-col-header-cell-cushion ">Sat</a>
														</div></th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</th>
						</tr>
					</thead>
					<tbody role="rowgroup">
						<tr role="presentation"
							class="fc-scrollgrid-section fc-scrollgrid-section-body  fc-scrollgrid-section-liquid">
							<td role="presentation"><div
									class="fc-scroller-harness fc-scroller-harness-liquid">
									<div class="fc-scroller fc-scroller-liquid-absolute"
										style="overflow: hidden auto;">
										<div class="fc-daygrid-body fc-daygrid-body-unbalanced "
											style="width: 761px;">
											<table role="presentation" class="fc-scrollgrid-sync-table"
												style="width: 761px; height: 541px;">
												<colgroup></colgroup>
												<tbody role="presentation">
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
															data-date="2020-09-27" aria-labelledby="fc-dom-1265"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1265" class="fc-daygrid-day-number"
																		title="Go to September 27, 2020" data-navlink=""
																		tabindex="0">27</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div
																			class="fc-bg-event fc-event fc-event-end fc-event-past"
																			style="background-color: rgb(255, 159, 137);"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
															data-date="2020-09-28" aria-labelledby="fc-dom-1267"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1267" class="fc-daygrid-day-number"
																		title="Go to September 28, 2020" data-navlink=""
																		tabindex="0">28</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other"
															data-date="2020-09-29" aria-labelledby="fc-dom-1269"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1269" class="fc-daygrid-day-number"
																		title="Go to September 29, 2020" data-navlink=""
																		tabindex="0">29</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-event-harness"
																		style="margin-top: 0px;">
																		<a class="fc-daygrid-event fc-daygrid-dot-event fc-event fc-event-draggable fc-event-resizable fc-event-start fc-event-end fc-event-past"></a>
																	</div>
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past fc-day-other"
															data-date="2020-09-30" aria-labelledby="fc-dom-1271"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1271" class="fc-daygrid-day-number"
																		title="Go to September 30, 2020" data-navlink=""
																		tabindex="0">30</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
															data-date="2020-10-01" aria-labelledby="fc-dom-1273"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1273" class="fc-daygrid-day-number"
																		title="Go to October 1, 2020" data-navlink=""
																		tabindex="0">1</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
															data-date="2020-10-02" aria-labelledby="fc-dom-1275"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1275" class="fc-daygrid-day-number"
																		title="Go to October 2, 2020" data-navlink=""
																		tabindex="0">2</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
															data-date="2020-10-03" aria-labelledby="fc-dom-1277"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1277" class="fc-daygrid-day-number"
																		title="Go to October 3, 2020" data-navlink=""
																		tabindex="0">3</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
															data-date="2020-10-04" aria-labelledby="fc-dom-1279"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1279" class="fc-daygrid-day-number"
																		title="Go to October 4, 2020" data-navlink=""
																		tabindex="0">4</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
															data-date="2020-10-05" aria-labelledby="fc-dom-1281"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1281" class="fc-daygrid-day-number"
																		title="Go to October 5, 2020" data-navlink=""
																		tabindex="0">5</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
															data-date="2020-10-06" aria-labelledby="fc-dom-1283"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1283" class="fc-daygrid-day-number"
																		title="Go to October 6, 2020" data-navlink=""
																		tabindex="0">6</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
															data-date="2020-10-07" aria-labelledby="fc-dom-1285"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1285" class="fc-daygrid-day-number"
																		title="Go to October 7, 2020" data-navlink=""
																		tabindex="0">7</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
															data-date="2020-10-08" aria-labelledby="fc-dom-1287"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1287" class="fc-daygrid-day-number"
																		title="Go to October 8, 2020" data-navlink=""
																		tabindex="0">8</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
															data-date="2020-10-09" aria-labelledby="fc-dom-1289"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1289" class="fc-daygrid-day-number"
																		title="Go to October 9, 2020" data-navlink=""
																		tabindex="0">9</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-highlight"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
															data-date="2020-10-10" aria-labelledby="fc-dom-1291"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1291" class="fc-daygrid-day-number"
																		title="Go to October 10, 2020" data-navlink=""
																		tabindex="0">10</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
															data-date="2020-10-11" aria-labelledby="fc-dom-1293"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1293" class="fc-daygrid-day-number"
																		title="Go to October 11, 2020" data-navlink=""
																		tabindex="0">11</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
															data-date="2020-10-12" aria-labelledby="fc-dom-1295"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1295" class="fc-daygrid-day-number"
																		title="Go to October 12, 2020" data-navlink=""
																		tabindex="0">12</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
															data-date="2020-10-13" aria-labelledby="fc-dom-1297"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1297" class="fc-daygrid-day-number"
																		title="Go to October 13, 2020" data-navlink=""
																		tabindex="0">13</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
															data-date="2020-10-14" aria-labelledby="fc-dom-1299"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1299" class="fc-daygrid-day-number"
																		title="Go to October 14, 2020" data-navlink=""
																		tabindex="0">14</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
															data-date="2020-10-15" aria-labelledby="fc-dom-1301"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1301" class="fc-daygrid-day-number"
																		title="Go to October 15, 2020" data-navlink=""
																		tabindex="0">15</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
															data-date="2020-10-16" aria-labelledby="fc-dom-1303"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1303" class="fc-daygrid-day-number"
																		title="Go to October 16, 2020" data-navlink=""
																		tabindex="0">16</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
															data-date="2020-10-17" aria-labelledby="fc-dom-1305"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1305" class="fc-daygrid-day-number"
																		title="Go to October 17, 2020" data-navlink=""
																		tabindex="0">17</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
															data-date="2020-10-18" aria-labelledby="fc-dom-1307"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1307" class="fc-daygrid-day-number"
																		title="Go to October 18, 2020" data-navlink=""
																		tabindex="0">18</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
															data-date="2020-10-19" aria-labelledby="fc-dom-1309"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1309" class="fc-daygrid-day-number"
																		title="Go to October 19, 2020" data-navlink=""
																		tabindex="0">19</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
															data-date="2020-10-20" aria-labelledby="fc-dom-1311"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1311" class="fc-daygrid-day-number"
																		title="Go to October 20, 2020" data-navlink=""
																		tabindex="0">20</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
															data-date="2020-10-21" aria-labelledby="fc-dom-1313"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1313" class="fc-daygrid-day-number"
																		title="Go to October 21, 2020" data-navlink=""
																		tabindex="0">21</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
															data-date="2020-10-22" aria-labelledby="fc-dom-1315"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1315" class="fc-daygrid-day-number"
																		title="Go to October 22, 2020" data-navlink=""
																		tabindex="0">22</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
															data-date="2020-10-23" aria-labelledby="fc-dom-1317"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1317" class="fc-daygrid-day-number"
																		title="Go to October 23, 2020" data-navlink=""
																		tabindex="0">23</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
															data-date="2020-10-24" aria-labelledby="fc-dom-1319"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1319" class="fc-daygrid-day-number"
																		title="Go to October 24, 2020" data-navlink=""
																		tabindex="0">24</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past"
															data-date="2020-10-25" aria-labelledby="fc-dom-1321"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1321" class="fc-daygrid-day-number"
																		title="Go to October 25, 2020" data-navlink=""
																		tabindex="0">25</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past"
															data-date="2020-10-26" aria-labelledby="fc-dom-1323"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1323" class="fc-daygrid-day-number"
																		title="Go to October 26, 2020" data-navlink=""
																		tabindex="0">26</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past"
															data-date="2020-10-27" aria-labelledby="fc-dom-1325"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1325" class="fc-daygrid-day-number"
																		title="Go to October 27, 2020" data-navlink=""
																		tabindex="0">27</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past"
															data-date="2020-10-28" aria-labelledby="fc-dom-1327"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1327" class="fc-daygrid-day-number"
																		title="Go to October 28, 2020" data-navlink=""
																		tabindex="0">28</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past"
															data-date="2020-10-29" aria-labelledby="fc-dom-1329"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1329" class="fc-daygrid-day-number"
																		title="Go to October 29, 2020" data-navlink=""
																		tabindex="0">29</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past"
															data-date="2020-10-30" aria-labelledby="fc-dom-1331"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1331" class="fc-daygrid-day-number"
																		title="Go to October 30, 2020" data-navlink=""
																		tabindex="0">30</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past"
															data-date="2020-10-31" aria-labelledby="fc-dom-1333"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1333" class="fc-daygrid-day-number"
																		title="Go to October 31, 2020" data-navlink=""
																		tabindex="0">31</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
													<tr role="row">
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sun fc-day-past fc-day-other"
															data-date="2020-11-01" aria-labelledby="fc-dom-1335"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1335" class="fc-daygrid-day-number"
																		title="Go to November 1, 2020" data-navlink=""
																		tabindex="0">1</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-mon fc-day-past fc-day-other"
															data-date="2020-11-02" aria-labelledby="fc-dom-1337"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1337" class="fc-daygrid-day-number"
																		title="Go to November 2, 2020" data-navlink=""
																		tabindex="0">2</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-tue fc-day-past fc-day-other"
															data-date="2020-11-03" aria-labelledby="fc-dom-1339"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1339" class="fc-daygrid-day-number"
																		title="Go to November 3, 2020" data-navlink=""
																		tabindex="0">3</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-wed fc-day-past fc-day-other"
															data-date="2020-11-04" aria-labelledby="fc-dom-1341"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1341" class="fc-daygrid-day-number"
																		title="Go to November 4, 2020" data-navlink=""
																		tabindex="0">4</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-thu fc-day-past fc-day-other"
															data-date="2020-11-05" aria-labelledby="fc-dom-1343"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1343" class="fc-daygrid-day-number"
																		title="Go to November 5, 2020" data-navlink=""
																		tabindex="0">5</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-fri fc-day-past fc-day-other"
															data-date="2020-11-06" aria-labelledby="fc-dom-1345"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1345" class="fc-daygrid-day-number"
																		title="Go to November 6, 2020" data-navlink=""
																		tabindex="0">6</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg"></div>
															</div></td>
														<td role="gridcell"
															class="fc-daygrid-day fc-day fc-day-sat fc-day-past fc-day-other"
															data-date="2020-11-07" aria-labelledby="fc-dom-1347"><div
																class="fc-daygrid-day-frame fc-scrollgrid-sync-inner">
																<div class="fc-daygrid-day-top">
																	<a id="fc-dom-1347" class="fc-daygrid-day-number"
																		title="Go to November 7, 2020" data-navlink=""
																		tabindex="0">7</a>
																</div>
																<div class="fc-daygrid-day-events">
																	<div class="fc-daygrid-day-bottom"
																		style="margin-top: 0px;"></div>
																</div>
																<div class="fc-daygrid-day-bg">
																	<div class="fc-daygrid-bg-harness"
																		style="left: 0px; right: 0px;">
																		<div class="fc-non-business"></div>
																	</div>
																</div>
															</div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="calendar-modal" class="modal fade">
		<!-- Add Modal -->
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">다이어리 작성하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<span>몸무게 : </span> <input type="text" id="weight"><span>kg</span>
					<div>
						<button id="breakfast">kcal</button>
						<button id="lunch">kcal</button>
						<button id="dinner">kcal</button>
					</div>
					<div>
						<span>아침</span> <span>점심</span> <span>저녁</span>
					</div>
					<div>
						<button id="snack1">kcal</button>
						<button id="snack2">kcal</button>
						<button id="snack3">kcal</button>
					</div>
					<div>
						<span>오전간식</span> <span>오후간식</span> <span>야식</span>
					</div>
					<div>
						<input type="text" placeholder="식단메뉴 검색">
					</div>
					<div>
						<table class="">
							<tr>
								<td></td>
								<td><button class="minus-box">-</button></td>
							</tr>
						</table>
					</div>
					<div>
						<input type="text" placeholder="운동 검색">
					</div>
					<div>
						<table class="">
							<tr>
								<td></td>
								<td><button class="minus-box">-</button></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger">취소</button>
					<button type="button" class="btn btn-success">등록</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script
	src="<%=request.getContextPath()%>/resources/calendar/lib/main.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/calendar/lib/calendar.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.2.0/dist/chart.umd.min.js"></script>