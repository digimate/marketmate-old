package com.digimate.marketmate.customview;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class DotView extends ImageView {

	private boolean isActive = false;
	private int activeDrawableId;
	private int inActiveDrawableId;

	public DotView(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	public DotView(Context context, AttributeSet attrs, int activeDrawableId, int inActiveDrawableId) {
		super(context, attrs);

		this.activeDrawableId = activeDrawableId;
		this.inActiveDrawableId = inActiveDrawableId;
		setImageResource(inActiveDrawableId);
		
		LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
		lp.setMargins(10, 0, 10, 0);
		setLayoutParams(lp);
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;

		if (this.isActive) {
			setImageResource(this.activeDrawableId);
		} else {
			setImageResource(this.inActiveDrawableId);
		}
	}
}
