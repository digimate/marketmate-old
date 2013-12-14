package com.digimate.marketmate.customview;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;

public class PageControlView extends LinearLayout {

	private Context context;

	private int totalPage;
	private int currentPage;
	private int activeDrawableId;
	private int inActiveDrawableId;

	private List<DotView> dotList;

	public PageControlView(Context context, AttributeSet attrs) {
		super(context, attrs);

		this.context = context;
		
		dotList = new ArrayList<DotView>();
	}

	public PageControlView(Context context, AttributeSet attrs, int totalPage, int activeDrawableId, int inActiveDrawableId) {
		super(context, attrs);

		this.context = context;
		this.setTotalPage(totalPage);
		this.setActiveDrawableId(activeDrawableId);
		this.setInActiveDrawableId(inActiveDrawableId);

		dotList = new ArrayList<DotView>(totalPage);
		for (int i = 0; i < totalPage; i++) {
			DotView dot = new DotView(context, null, activeDrawableId, inActiveDrawableId);
			if (i == 0) {
				dot.setActive(true);
			}
			dotList.add(dot);
			addView(dot);
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		
		for (int i = 0; i < totalPage; i++) {
			DotView dot = new DotView(context, null, activeDrawableId, inActiveDrawableId);
			if (i == 0) {
				dot.setActive(true);
			}
			dotList.add(dot);
			addView(dot);
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		
		for (int i = 0; i < totalPage; i++) {
			dotList.get(i).setImageResource(inActiveDrawableId);
		}
		
		dotList.get(currentPage).setImageResource(activeDrawableId);
	}

	public int getActiveDrawableId() {
		return activeDrawableId;
	}

	public void setActiveDrawableId(int activeDrawableId) {
		this.activeDrawableId = activeDrawableId;
	}

	public int getInActiveDrawableId() {
		return inActiveDrawableId;
	}

	public void setInActiveDrawableId(int inActiveDrawableId) {
		this.inActiveDrawableId = inActiveDrawableId;
	}
}
