package com.digimate.marketmate.fragment;


import java.util.ArrayList;
import java.util.List;


import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.TextView;

import com.digimate.marketmate.ActivityMybox;
import com.digimate.marketmate.R;
import com.digimate.marketmate.adapter.ProductListAdapter;
import com.digimate.marketmate.data.Product;

public class FragementProduct extends Fragment {

	private View rootView;

	private ListView listviewProduct;
	private List<Product> productList;
	private ProductListAdapter adapter;


	private TextView textviewFavourite;
	private TextView textviewMyPost;
	private TextView textviewExpiredPost;

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub

		rootView = inflater.inflate(R.layout.fragment_product, container);

		textviewFavourite = (TextView) rootView.findViewById(R.id.txt_favourite);
		textviewFavourite.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				textviewFavourite.setTextColor(Color.WHITE);
				textviewMyPost.setTextColor(Color.GRAY);
				textviewExpiredPost.setTextColor(Color.GRAY);

			}
		});
		textviewMyPost = (TextView) rootView.findViewById(R.id.txt_mypost);
		textviewMyPost.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				textviewMyPost.setTextColor(Color.WHITE);
				textviewFavourite.setTextColor(Color.GRAY);
				textviewExpiredPost.setTextColor(Color.GRAY);

			}
		});
		textviewExpiredPost = (TextView) rootView.findViewById(R.id.txt_expired);
		textviewExpiredPost.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				textviewExpiredPost.setTextColor(Color.WHITE);
				textviewMyPost.setTextColor(Color.GRAY);
				textviewFavourite.setTextColor(Color.GRAY);

			}
		});

		listviewProduct = (ListView) rootView.findViewById(R.id.lv_product);
		productList = new ArrayList<Product>();
		adapter = new ProductListAdapter(ActivityMybox.context, R.layout.list_item, productList);
		listviewProduct.setAdapter(adapter);

		getProducts();

		return rootView;
	}

	private void getProducts(){
		int num = 10;
		for (int i = 0; i < num; i++){
			Product product = new Product("Product " + i, "Owner " + i, "Good", 100, 100, 100, "");
			productList.add(product);
		}
		
		adapter.notifyDataSetChanged();
	}
	private void setContents() {

	}

	public void setVisibility(int visibility) {
		rootView.setVisibility(visibility);
	}


}
