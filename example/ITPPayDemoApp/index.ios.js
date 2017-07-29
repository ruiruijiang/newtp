/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  RCTNativeAppEventEmitter
} from 'react-native';

var tp = require('itppay-react-native'); 


export default class ITPPayDemoApp extends Component {


  pay=(channel)=>{
  var orderNo = new Date().getTime()+"";
	var params = {
						appid: '0000000022',
						appkey: 'e7d4c31780d1379c6af38f82e455967c',
						subject: 'test goods',
						amount: '1',
						body: 'testonetest',
						mchntOrderNo: orderNo+"",
						notifyUrl: 'http://www.baidu.com',
						cpChannel: '',
						description: '',
						extra: 'aa',
            payStyle: channel,
            appScheme:'ruiruijiang',
         }
           
         tp.itppay(params,function(payResultCode,msg){

            alert(payResultCode);


					}
					);
  }
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress = {()=>{this.pay(tp.ALIPAY)}}>
          <Text style={styles.welcome}>支付宝</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>{this.pay(tp.WECHAT)}}>
          <Text style={styles.welcome}>微信</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>{this.pay(tp.UNIONPAY)}}>
          <Text style={styles.welcome}>银联</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>{this.pay(tp.JD)}}>
          <Text style={styles.welcome}>京东</Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={()=>{this.pay(tp.QQ)}}>
          <Text style={styles.welcome}>QQ</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('ITPPayDemoApp', () => ITPPayDemoApp);
