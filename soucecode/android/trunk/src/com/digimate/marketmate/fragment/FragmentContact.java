package com.digimate.marketmate.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.digimate.marketmate.R;

public class FragmentContact extends Fragment {

	private View rootView;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {

		rootView = inflater.inflate(R.layout.fragment_contactpage, container);

		setContents();

		return rootView;
	}

	private void setContents() {

	}

	public void setVisibility(int visibility) {
		rootView.setVisibility(visibility);
	}
}
