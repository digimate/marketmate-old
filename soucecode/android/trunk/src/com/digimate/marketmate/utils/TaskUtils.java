package com.digimate.marketmate.utils;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;

public class TaskUtils extends AsyncTask<Void, Void, Void>{

	private ProgressDialog progressDialog;
	private Context context;

	public TaskUtils(Context pContext) {
		context = pContext;
	}

	protected void onPreExecute() {
		super.onPreExecute();
		progressDialog = new ProgressDialog(context);
		progressDialog.setMessage("Loading...");
		progressDialog.show();
	}

	protected void onPostExecute(Void result) {
		super.onPostExecute(result);
		if (progressDialog != null && progressDialog.isShowing()) {
			progressDialog.dismiss();
		}
	}

	protected Void doInBackground(Void... params) {
		return null;
	}

}
