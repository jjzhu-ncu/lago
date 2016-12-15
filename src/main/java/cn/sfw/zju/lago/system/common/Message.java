package cn.sfw.zju.lago.system.common;

public class Message {
	private ResponseCode code;
	private Object data;
	
	
	public ResponseCode getResponseCode() {
		return code;
	}
	public void setResponseCode(ResponseCode code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
