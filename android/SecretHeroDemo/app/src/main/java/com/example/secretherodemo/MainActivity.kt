package com.example.secretherodemo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import com.secrethero.secrethero.SecretHero
import com.secrethero.secrethero.SecretHeroListener
import com.secrethero.secrethero.config.SecretHeroConfig

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        SecretHero.initialize(
            SecretHeroConfig.Builder()
                .setUserId("user_id")
                .setDisplayName("display_name")
                //.setIconImage("ICON")
                .build("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJRCI6IjEiLCJpYXQiOjE2OTgwNzA3Mjl9.Tf_QBI0PM8EHVI0xqmFdqkjtcI5-q2ciyGhnASBhfY8"), object :
                SecretHeroListener {
                override fun onInitialized() {
                    Log.d("[SecretHero]", "onInitialized")
                }

                override fun onInitializeFailed(errorMessage: String) {
                    Log.d("[SecretHero]", "onInitializeFailed")
                }

                override fun onClose() {
                    Log.d("[SecretHero]", "onClose")
                }

                override fun onOpen() {
                    Log.d("[SecretHero]", "onOpen")
                }
            })

        /*As optional can use instead of SecretHeroView :
        SecretHero.start(context = this)
         */
    }

    override fun onDestroy() {
        super.onDestroy()
        SecretHero.release()
    }
}