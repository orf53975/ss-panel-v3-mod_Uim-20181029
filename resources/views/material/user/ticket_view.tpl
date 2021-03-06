


{include file='user/main.tpl'}





	<main class="content">

		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">查看工单</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
				
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="content">点击这里输入内容</label>
									<textarea class="form-control" id="content" rows="15"></textarea>
								</div>
								
								
								
								
							</div>
						</div>
					</div>
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								
								<div class="form-group">
									<div class="row">
										<div class="col-md-10 col-md-push-1">
											<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">添加</button><button id="close" type="submit" class="btn btn-block btn-brand-accent waves-attach waves-light">添加并关闭</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					{$ticketset->render()}
					
					{foreach $ticketset as $ticket}
					<div class="card">
						<aside class="card-side pull-left"><img alt="alt text for John Smith avatar" src="{$ticket->User()->gravatar}"></span></br>{$ticket->User()->user_name}</aside>
						<div class="card-main">
							<div class="card-inner">
								{$ticket->content}
								
								
							</div>
							<div class="card-action"> {$ticket->datetime()}</div>
						</div>
					</div>
					{/foreach}
					
					{$ticketset->render()}
					
					{include file='dialog.tpl'}

							
			</div>
			
			
			
		</div>
	</main>






{include file='user/footer.tpl'}





<script>
    $(document).ready(function () {
        function submit() {
			$("#result").modal();
            $("#msg").html("正在提交。");
            $.ajax({
                type: "PUT",
                url: "/user/ticket/{$id}",
                dataType: "json",
                data: {
                    content: $("#content").val(),
					
					status:status
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='/user/ticket'", {$config['jump_delay']});
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                }
            });
        }
		
        $("#submit").click(function () {
			status=1;
            submit();
        });
		
		$("#close").click(function () {
			status=0;
            submit();
        });
    });
	
</script>







