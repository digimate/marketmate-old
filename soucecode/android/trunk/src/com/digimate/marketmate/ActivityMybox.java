package com.digimate.marketmate;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.Window;

import com.digimate.marketmate.customview.TopMenu;
import com.digimate.marketmate.fragment.FragementFollows;
import com.digimate.marketmate.fragment.FragementInbox;
import com.digimate.marketmate.fragment.FragementProduct;

public class ActivityMybox extends FragmentActivity {
	public static Context context;

	public static final int MENU_INBOX = 0;
	public static final int MENU_FOLLOWS = 1;
	public static final int MENU_PRODUCT = 2;

	private static TopMenu[] topMenus;
	private TopMenu menuInbox;
	private TopMenu menuFollows;
	private TopMenu menuProduct;

	private static FragementInbox fragmentInbox;
	private static FragementFollows fragmentFollows;
	private static FragementProduct fragmentProduct;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);

		ActivityMybox.context = this;

		requestWindowFeature(Window.FEATURE_NO_TITLE);

		setContentView(R.layout.mybox_page);

		// Set contents
		setContents();

	}
	private void setContents() {
		/*
		 * Top menu 
		 */
		topMenus = new TopMenu[3];
		topMenus[0] = (TopMenu) findViewById(R.id.menu_inbox);
		topMenus[0].setText(getResources().getString(R.string.topmenu_inbox));
		topMenus[0].setSelected(true);
		topMenus[0].setId(MENU_INBOX);
		topMenus[0].setOnClick(1);

		topMenus[1] = (TopMenu) findViewById(R.id.menu_follows);
		topMenus[1].setText(getResources().getString(R.string.topmenu_follows));
		topMenus[1].setId(MENU_FOLLOWS);
		topMenus[1].setOnClick(1);

		topMenus[2] = (TopMenu) findViewById(R.id.menu_product);
		topMenus[2].setText(getResources().getString(R.string.topmenu_product));
		topMenus[2].setId(MENU_PRODUCT);
		topMenus[2].setOnClick(1);



		/*
		 * Fragments
		 */
		fragmentInbox = (FragementInbox) getSupportFragmentManager().findFragmentById(R.id.fragment_inbox);

		fragmentFollows = (FragementFollows) getSupportFragmentManager().findFragmentById(R.id.fragment_follows);
		fragmentFollows.setVisibility(View.GONE);

		fragmentProduct = (FragementProduct) getSupportFragmentManager().findFragmentById(R.id.fragment_product);
		fragmentProduct.setVisibility(View.GONE);


	}
	public static void switchToMenu(int activeMenuId) {
		if (activeMenuId < 0 || activeMenuId > MENU_PRODUCT) {
			return;
		} 

		// Change background of menu
		for (int i = 0; i <= MENU_PRODUCT; i++) {
			topMenus[i].setSelected(false);
		}
		topMenus[activeMenuId].setSelected(true);

		if (activeMenuId == MENU_INBOX) {
			fragmentInbox.setVisibility(View.VISIBLE);
			fragmentFollows.setVisibility(View.GONE);
			fragmentProduct.setVisibility(View.GONE);

		} else if (activeMenuId == MENU_FOLLOWS) {
			fragmentInbox.setVisibility(View.GONE);
			fragmentFollows.setVisibility(View.VISIBLE);
			fragmentProduct.setVisibility(View.GONE);

		} else if (activeMenuId == MENU_PRODUCT) {
			fragmentInbox.setVisibility(View.GONE);
			fragmentFollows.setVisibility(View.GONE);
			fragmentProduct.setVisibility(View.VISIBLE);


		}
	}

}
