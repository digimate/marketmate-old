package com.digimate.marketmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;

public class ActivityMenu extends Activity{
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.menu);
		
		Button btHome = (Button) findViewById(R.id.button_home);
		btHome.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityHome.class);
				startActivity(intent);
				
			}
		});
		Button btDetails = (Button) findViewById(R.id.button_details);
		btDetails.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityDetails.class);
				startActivity(intent);
				
			}
		});
		Button btMybox = (Button) findViewById(R.id.button_mybox);
		btMybox.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityMybox.class);
				startActivity(intent);
				
			}
		});
		Button btList = (Button) findViewById(R.id.button_list);
		btList.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityList.class);
				startActivity(intent);
				
			}
		});
		Button btAccount = (Button) findViewById(R.id.button_account);
		btAccount.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityAccountSetting.class);
				startActivity(intent);
				
			}
		});
		Button btPost = (Button) findViewById(R.id.button_post);
		btPost.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityPostPage.class);
				startActivity(intent);
				
			}
		});
		Button btAllcategory = (Button) findViewById(R.id.button_allcategory);
		btAllcategory.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivityAllCategory.class);
				startActivity(intent);
				
			}
		});
		Button btSignup = (Button) findViewById(R.id.button_signupstep);
		btSignup.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(ActivityMenu.this,ActivitySignupStep2.class);
				startActivity(intent);
				
			}
		});
	}
}
