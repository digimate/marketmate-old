package com.digimate.marketmate.fragment;

import com.digimate.marketmate.R;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class FragmentSignUp extends Fragment {

private View rootView;
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		
		rootView = inflater.inflate(R.layout.fragment_signup, container);

		setContents();

		return rootView;
	}
	
	private void setContents() {
		
	}
	
	public void setVisibility(int visibility) {
		rootView.setVisibility(visibility);
	}
}
