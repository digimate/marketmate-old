package com.digimate.marketmate.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.ViewFlipper;

import com.digimate.marketmate.ActivityHome;
import com.digimate.marketmate.R;
import com.digimate.marketmate.customview.PageControlView;

public class FragmentGuest extends Fragment {

	private View rootView;

	private PageControlView pageControl;

	private ViewFlipper topViewFlipper;
	private ViewFlipper bottomViewFlipper;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {

		rootView = inflater.inflate(R.layout.fragment_guest, container);

		setContents();

		return rootView;
	}

	private void setContents() {
		// Add page control
		pageControl = (PageControlView) rootView.findViewById(R.id.page_control);
		pageControl.setTotalPage(3);
		pageControl.setActiveDrawableId(R.drawable.dot_active);
		pageControl.setInActiveDrawableId(R.drawable.dot_non_active);

		// Top ads
		topViewFlipper = (ViewFlipper) rootView.findViewById(R.id.vf_top);
		topViewFlipper.setInAnimation(AnimationUtils.loadAnimation(ActivityHome.context, R.anim.slide_right_in));
		topViewFlipper.setOutAnimation(AnimationUtils.loadAnimation(ActivityHome.context, R.anim.slide_left_out));

		// Bottom ads
		bottomViewFlipper = (ViewFlipper) rootView.findViewById(R.id.vf_bottom);
		bottomViewFlipper.setInAnimation(AnimationUtils.loadAnimation(ActivityHome.context, R.anim.fade_in));
		bottomViewFlipper.setAnimation(AnimationUtils.loadAnimation(ActivityHome.context, R.anim.fade_out));
	}
	
	public void setVisibility(int visibility) {
		rootView.setVisibility(visibility);
	}
}
