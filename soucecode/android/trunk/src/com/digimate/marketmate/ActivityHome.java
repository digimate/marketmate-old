package com.digimate.marketmate;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.Window;

import com.digimate.marketmate.customview.TopMenu;
import com.digimate.marketmate.fragment.FragmentContact;
import com.digimate.marketmate.fragment.FragmentGuest;
import com.digimate.marketmate.fragment.FragmentLogIn;
import com.digimate.marketmate.fragment.FragmentSignUp;

public class ActivityHome extends FragmentActivity {

	public static Context context;

	public static final int MENU_GUEST = 0;
	public static final int MENU_LOGIN = 1;
	public static final int MENU_SIGNUP = 2;
	public static final int MENU_CONTACT_US = 3;

	private static TopMenu[] topMenus;
	private TopMenu menuGuest;
	private TopMenu menuLogin;
	private TopMenu menuSignUp;
	private TopMenu menuContactUs;

	private static FragmentGuest fragmentGuest;
	private static FragmentLogIn fragmentLogin;
	private static FragmentSignUp fragmentSignUp;
	private static FragmentContact fragmentContact;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		ActivityHome.context = this;

		requestWindowFeature(Window.FEATURE_NO_TITLE);

		setContentView(R.layout.activity_home);

		// Set contents
		setContents();
	}

	private void setContents() {
		/*
		 * Top menu 
		 */
		topMenus = new TopMenu[4];
		topMenus[0] = (TopMenu) findViewById(R.id.menu_guest);
		topMenus[0].setText(getResources().getString(R.string.topmenu_guest));
		topMenus[0].setSelected(true);
		topMenus[0].setId(MENU_GUEST);
		topMenus[0].setOnClick(0);

		topMenus[1] = (TopMenu) findViewById(R.id.menu_login);
		topMenus[1].setText(getResources().getString(R.string.topmenu_login));
		topMenus[1].setId(MENU_LOGIN);
		topMenus[1].setOnClick(0);

		topMenus[2] = (TopMenu) findViewById(R.id.menu_signup);
		topMenus[2].setText(getResources().getString(R.string.topmenu_signup));
		topMenus[2].setId(MENU_SIGNUP);
		topMenus[2].setOnClick(0);

		topMenus[3] = (TopMenu) findViewById(R.id.menu_contactus);
		topMenus[3].setText(getResources().getString(R.string.topmenu_contact_us));
		topMenus[3].setId(MENU_CONTACT_US);
		topMenus[3].setOnClick(0);

		/*
		 * Fragments
		 */
		fragmentGuest = (FragmentGuest) getSupportFragmentManager().findFragmentById(R.id.fragment_guest);

		fragmentLogin = (FragmentLogIn) getSupportFragmentManager().findFragmentById(R.id.fragment_login);
		fragmentLogin.setVisibility(View.GONE);

		fragmentSignUp = (FragmentSignUp) getSupportFragmentManager().findFragmentById(R.id.fragment_signup);
		fragmentSignUp.setVisibility(View.GONE);

		fragmentContact = (FragmentContact) getSupportFragmentManager().findFragmentById(R.id.fragment_contact_us);
		fragmentContact.setVisibility(View.GONE);
	}

	public static void switchToMenu(int activeMenuId) {
		if (activeMenuId < 0 || activeMenuId > MENU_CONTACT_US) {
			return;
		} 

		// Change background of menu
		for (int i = 0; i <= MENU_CONTACT_US; i++) {
			topMenus[i].setSelected(false);
		}
		topMenus[activeMenuId].setSelected(true);

		if (activeMenuId == MENU_GUEST) {
			fragmentGuest.setVisibility(View.VISIBLE);
			fragmentLogin.setVisibility(View.GONE);
			fragmentSignUp.setVisibility(View.GONE);
			fragmentContact.setVisibility(View.GONE);
		} else if (activeMenuId == MENU_LOGIN) {
			fragmentGuest.setVisibility(View.GONE);
			fragmentLogin.setVisibility(View.VISIBLE);
			fragmentSignUp.setVisibility(View.GONE);
			fragmentContact.setVisibility(View.GONE);
		} else if (activeMenuId == MENU_SIGNUP) {
			fragmentGuest.setVisibility(View.GONE);
			fragmentLogin.setVisibility(View.GONE);
			fragmentSignUp.setVisibility(View.VISIBLE);
			fragmentContact.setVisibility(View.GONE);
		} else if (activeMenuId == MENU_CONTACT_US) {
			fragmentGuest.setVisibility(View.GONE);
			fragmentLogin.setVisibility(View.GONE);
			fragmentSignUp.setVisibility(View.GONE);
			fragmentContact.setVisibility(View.VISIBLE);
		}
	}

}
