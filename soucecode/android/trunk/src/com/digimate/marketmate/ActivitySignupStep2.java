package com.digimate.marketmate;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;

public class ActivitySignupStep2 extends Activity{
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		setContentView(R.layout.fragment_signup_step2);
	}

}
