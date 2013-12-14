<table>
	<tr>
		<td>Id</td>
		<td>username</td>
		<td>password</td>
	</tr>
	<?php foreach($users_view as $user){ ?>
	<tr>
		<td><?php echo $user['User']['id']; ?></td>
		<td><?php echo $user['User']['username']; ?></td>
		<td><?php echo $user['User']['password']; ?></td>
	</tr>
	<?php } ?>
</table>
