package com.digimate.marketmate;

import com.digimate.marketmate.common.Shared;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.view.Window;

public class ActivitySplash extends Activity {

	private CountDownTimer countdownTimer;
	
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		
		setContentView(R.layout.activity_splash);
		
		loadData();
	}
	
	private void loadData() {
		
		Shared.helveticaNeueFont = Typeface.createFromAsset(getAssets(), "font/helvetica_neue.ttc");
		
		countdownTimer = new CountDownTimer(2000, 2000) {
			
			public void onTick(long millisUntilFinished) {
				
			}
			
			public void onFinish() {
				Intent intent = new Intent(ActivitySplash.this, ActivityHome.class);
				startActivity(intent);
				
				finish();
			}
		};
		
		countdownTimer.start();
	}
	
	@Override
	public void onBackPressed() {
		super.onBackPressed();
		
		if (countdownTimer != null) {
			countdownTimer.cancel();
		}
	}
	
}
