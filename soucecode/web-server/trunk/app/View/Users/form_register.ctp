<?php
	echo $this->Html->script('canvasResize');
	echo $this->Html->script('binaryajax');
	echo $this->Html->script('exif');
	echo $this->Html->script('zepto.min');

	echo $this->Form->create('User', array('type'=>'file', 'action'=>'register'));
		echo $this->Form->input('file_upload', array('type'=>'file','name'=>'image'));
	echo $this->Form->end('finish');

	echo $this->Html->image('pas.png', array('alt'=>'no-image', 'id'=>'image_upload'));
?>
<script type="text/javascript">
$('input[name=image]').change(function(e) {
	//alert('dfdfddf');
    var file = e.target.files[0];
    canvasResize(file, {
                width: 300,
                height: 0,
                crop: false,
                quality: 80,
                //rotate: 90,
                callback: function(data, width, height) {
                    //$(img).attr('src', data);
                    //alert(data);
                    $.ajax({
						url: 'http://localhost/marketMATE/users/register',
						type: 'POST',
						data: {data:data}
					}).done(function(msg){
						alert(msg);
						$('#image_upload').attr('src',msg);
					});
                }
    });
});
</script>