<div align="center">
    <img src=".github/lalafell.png" />
    <h1>XIVLauncher Auto OTP</h1>
</div>

## What is XIVLauncher Auto OTP?
It is a tool for generating OTP tokens for use with XIVLauncher on the Steam Deck to prevent the need to type anything when logging into Final Fantasy XIV.

To see a demonstration of how this works, check out [This YouTube Video](https://www.youtube.com/watch?v=-JH7yQgBsx0). Note that this video does not have the script that automatically runs this tool.

## Why is this a thing?
I personally find it difficult to use the text entry on the Steam Deck, XIVLauncher allows you to save your password to avoid having to type this out every time, however, it still requires a 2FA token be entered. This tool will automatically generate and pass the token to XIVLauncher when launched through the Steam Deck.

## Is this safe?
The answer to this depends on your risk appetite. The tool itself is by no means unsafe, however, much like when you save your password in XIVLauncher - this will result in your 2FA configuration being stored on the same device; some what defeating the main purpose of having 2FA (that being requiring a second device in the authentication process)

In practical terms, this means that if someone were able to steal your Steam Deck, they could in theory compromise your account, assuming you don't change your password / register a new 2FA token before they troll through the device.

Likewise, if someone were to compromise the device remotely and be able to access the file system, they could in theory steal the credentials (though, if someone has compromised the user session remotely, it would be trivial for them to capture this data and use it to compromise the account without this tool installed).

Although the protection that 2FA provides against things such as brute force attacks or compromised passwords is unaffected, it is important that you understand the risk introduced by doing this should your Steam Deck be stolen by someone who understands what the 2FA key / secret is before you can remove it from your Square Enix account.

## Setup guide
1. Ensure XIV Launcher is installed as a Steam Compatibility Tool (https://goatcorp.github.io/faq/steamdeck.html), and force XLCore [XLM] as the compatibility tool for Final Fantasy XIV Online in Steam.
2. Launch Final Fantasy XIV Online through steam to open XIV Launcher.
3. Enable the OTP app feature in the settings screen of XIVLauncher (see the [Authenticator App Guide](https://goatcorp.github.io/faq/mobile_otp#enabling-the-otp-app-feature-in-xivlauncher) for more information).
4. On the login screen, enter your username and password, ticking "Use One-Time Password" and "automatically log in", then log in.
5. Enter your OTP manually (you only have to do this once), and wait for it to login. You can then close the game.
6. Download XLM.ZIP from [The Latest Release](https://github.com/trintin94/xivlauncher-auto-otp/releases/latest).
7. Unzip XLM.zip.
8. In Desktop Mode, go to /home/deck/.steam/steam/compatibilitytools.d/ (there should already be an XLM folder here)
9. Paste the XLM folder here, merging with the pre-existing folder.
10. Navigate to /home/deck/.steam/steam/compatibilitytools.d/XLM/prelaunch.d/ and right click auto-otp.sh and open with Kate (or any text editor)
11. Replace InsertSecretHere with your OTP Secret (see the readme to obtain), keeping the speech marks. Then save and close.
12. Right click auto-otp.sh again, click properties, go to permissions and ensure "Allow executing file as program" is ticked.

You are now setup! To use the tool:

 - Launch Final Fantasy XIV as you normally would on your Steam Deck.
 - When prompted for your 2FA code, wait a couple seconds, and it should automatically move on.

## How do I find my OTP secret?
The OTP secret (also known as the "seed" or "key") is a 32 character long string that determines what tokens are generated for you by the application. In order for this tool to work, it needs to be able to generate tokens for you the same way your regular 2FA application does when you are generating tokens to login on the website or on other platforms.

How you find the OTP secret will depend on what application you are using to generate your 2FA tokens. Lots of applications (such as Google's own, Authy and others) will not allow you to retrieve the seed used to setup the token.

Some apps, such as KeePassXC, will allow you to see the `otpauth` URI that will contain the encoded secret (in KeePassXC this can be found in the `Advanced > Additional attributes > otp` entry, you will see a URI that contains a `secret` parameter like this: `otpauth://totp/Square%20Enix:YOUR_USERNAME?secret=YOUR_2FA_SECRET_HERE&period=30&digits=6&issuer=Square%20Enix`)

If you are unable to extract the secret from your current 2FA setup, your only way forward will be to remove the existing 2FA from your account, and set it up again, but when setting it back up, choosing to enter the key (aka the secret) manually rather than using the QR code.

For instructions on setting up an authenticator without a QR code, see [https://www.square-enix-games.com/en_GB/seaccount/otp/authenticator.html](https://www.square-enix-games.com/en_GB/seaccount/otp/authenticator.html); specifically, the section titled `Registration for Google Authenticator (Authentication Key Entry)`.

When setting your 2FA back up this way, make note of the key that you are entering into your Google Authenticator app, as this will be the value we use as the secret in XIVLauncher Auto OTP.

Most (if not all) Google Authenticator apps should support adding new tokens by entering a key manually.

## License
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at [https://mozilla.org/MPL/2.0/](https://mozilla.org/MPL/2.0/).
