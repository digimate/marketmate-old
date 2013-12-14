package com.digimate.marketmate.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ViewFlipper;

import com.digimate.marketmate.R;
import com.digimate.marketmate.customview.PageControlView;

public class FragementInbox extends Fragment {

	private View rootView;

	private PageControlView pageControl;

	private ViewFlipper topViewFlipper;
	private ViewFlipper bottomViewFlipper;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub

		rootView = inflater.inflate(R.layout.fragment_inbox, container);


		return rootView;
	}
	private void setContents() {

	}

	public void setVisibility(int visibility) {
		rootView.setVisibility(visibility);
	}
	
}
