package com.digimate.marketmate.customview;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.digimate.marketmate.ActivityHome;
import com.digimate.marketmate.ActivityMybox;
import com.digimate.marketmate.R;

public class TopMenu extends LinearLayout {
	private TextView menuName;
	// private LinearLayout menuLayout;
	private Context context;
	private int id;

	public TopMenu(Context context, AttributeSet attrs) {
		super(context, attrs);
		// TODO Auto-generated constructor stub
		this.context = context;
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		inflater.inflate(R.layout.topmenu, this);
		menuName = (TextView) findViewById(R.id.tv_name);

		setSelected(false);
	}

	public void setText(String name) {
		menuName.setText(name);
		// menuName.setTypeface(Shared.helveticaNeueFont);
	}

	public void setSelected(boolean selected) {
		if (selected) {
			setBackgroundColor(context.getResources().getColor(
					R.color.bg_topmenu_selected));
		} else {
			setBackgroundColor(context.getResources().getColor(
					R.color.bg_topmenu_normal));
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setOnClick(final int id) {
		this.setOnClickListener(new OnClickListener() {

			public void onClick(View v) {
				if(id == 0){
					ActivityHome.switchToMenu(TopMenu.this.id);
				}else{
					ActivityMybox.switchToMenu(TopMenu.this.id);
				}
			}
		});
	}
}
