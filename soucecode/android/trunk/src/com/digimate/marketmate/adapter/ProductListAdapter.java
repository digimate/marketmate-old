package com.digimate.marketmate.adapter;

import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.digimate.marketmate.R;
import com.digimate.marketmate.data.Product;

public class ProductListAdapter extends ArrayAdapter<Product> {

	private Context context;
	private int layoutId;
	private List<Product> data = null;

	public ProductListAdapter(Context context, int layoutId, List<Product> data) {
		super(context, layoutId, data);
		this.context = context;
		this.layoutId = layoutId;
		this.data = data;
		
		//Shared.imageLoader.init(ImageLoaderConfiguration
				//.createDefault(context));
	}

	public View getView(final int position, View convertView,
			ViewGroup parent) {
		ViewHolder holder;
		if (convertView == null) {
			LayoutInflater inflater = (LayoutInflater) context
					.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			convertView = inflater.inflate(layoutId, parent, false);

			holder = new ViewHolder();
			
			holder.imageviewPhoto = (ImageView) convertView
					.findViewById(R.id.iv_picture);
			holder.name = (TextView) convertView.findViewById(R.id.tv_name);
			holder.owner = (TextView) convertView.findViewById(R.id.tv_acount_name);
			holder.status = (TextView) convertView.findViewById(R.id.tv_status);
			holder.imageviewStatus = (ImageView) convertView.findViewById(R.id.iv_status);
			holder.view = (TextView) convertView.findViewById(R.id.tv_view);
			holder.comments = (TextView) convertView.findViewById(R.id.tv_comment);
			holder.price = (TextView) convertView.findViewById(R.id.tv_price);
			
			

			convertView.setTag(holder);
		} else {
			holder = (ViewHolder) convertView.getTag();
		}

		holder.name.setText(data.get(position).getName());
		holder.owner.setText(data.get(position).getOwner());
		holder.status.setText(data.get(position).getRating());
		holder.view.setText("" + data.get(position).getView());
		holder.comments.setText("" + data.get(position).getComment());
		holder.price.setText("" + data.get(position).getPrice());
		
		return convertView;
	}

	static class ViewHolder {
		ImageView imageviewPhoto;
		ImageView imageviewStatus;
		TextView name;
		TextView owner;
		TextView status;
		TextView view;
		TextView comments;
		TextView price;
		
	}
	
}
