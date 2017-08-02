## インストール

1. ストラクチャファイルと同階層に``Components``フォルダーを用意してください。

1. フォルダー内にコンポーネントのストラクチャファイル，つまり``annotation.4dbase``パッケージ，または``annotation.4DB`` / ``annotation.4DC`` と ``annotation.4DIndy``のペア）をコピーしてください。ショートカット（Windows）またはエイリアス（macOS）を使用することもできます。

1. ストラクチャをデザインモードで開き，エクスプローラーの「メソッド > コンポーネントメソッド」リストに「annotation」が表示されれば，インストールは成功です。

<img src="https://user-images.githubusercontent.com/1725068/28804621-61663c2a-769f-11e7-8657-2ce3c8d73bd1.png" width="292px" />

4. フォームに「サブフォーム」タイプのオブジェクトを配置します。オブジェクトのプロパティは下記のように設定してください。

* 出力サブフォーム: ``False``
* ソース: なし
* 詳細フォーム: ``Editor (annotation)``
* フォーカス可: ``True`` 
* 変数名: なし
* 変数タイプ: 文字列

その他のプロパティは自由に設定することができます。

フォームのプロパティは下記のように設定してください。

* 最小幅: ``600``以上
* 最小高さ: ``200``以上
* イベント: ``On Load``, ``On Unload``, ``On Resize``, ``On Outside Call``

その他のプロパティは自由に設定することができます。

5. サブフォームのオブジェクト名は，エディターの固有識別名として，後述する公開メソッドに渡されることになります。以下の説明では``Editor``というオブジェクト名を使用しています。

6. オブジェクトメソッドに下記の1行を追加します。

```
$event:=NEditor_Form_event ("Editor")
```

7. フォームメソッドに下記の1行を追加します。

```
$event:=NEditor_Form_event ("Editor")
```

8. フォームを実行すると，早速，エディターを使用することができます。

詳細は下記のドキュメントをご覧ください。

[デザインリファレンス > 4Dコンポーネントの開発とインストール > 
コンポーネントのインストールと互換性](http://doc.4d.com/4Dv16/4D/16/Component-installation-and-compatibility.300-3048906.ja.html)

## エディターの操作

エディターを起動した直後は，自由線ツールが選択されています。

四角・テキスト・円・線ツールを使用した後は，描画した新しいオブジェクトが選択された状態になり，続けて移動やリサイズをすることができます。

線・自由線ツールを使用した後は，選択ツールに切り替わらず，同種のオブジェクトを続けて描画することができます。

**カスタマイズ**: 最初に選択されているツールは，変更することができます。ソースコード内の``NEditor_SET_TOOL``を参照してください。

### 選択ツール

範囲指定でオブジェクトを選択します。また，選択されたオブジェクト群を移動またはリサイズすることができます。

**注記**: 透明度が``10%``に満たないオブジェクトをクリック操作で選択することはできません。たとえば，塗りカラーが「透過」に設定されている場合，描画ラインをクリックする必要があります。描画カラーも「透過」に設定されている場合，範囲指定でオブジェクトを選択する必要があります。

選択中のオブジェクトは，キーボード操作で移動またはリサイズすることもできます。

* 矢印キー: 上下左右に移動
* ``shift``+矢印キー: 上下左右にステップで移動（デフォルトは``10``ポイント）
* ``control (command)``+矢印キー: 上下左右にリサイズ
* ``control (command)``+``shift``+矢印キー: 上下左右にステップでリサイズ（デフォルトは``10``ポイント）

**カスタマイズ**:  ステップの単位は変更することができます。ソースコード内の``Editor_SET_STEP_X``, ``Editor_SET_STEP_Y``を参照してください。

通常，オブジェクトが選択された状態で別のオブジェクトをクリックすると，以前に選択されていたオブジェクトは選択が解除されます。``shift``キーを押しながらオブジェクトを続けてクリックすることにより，複数のオブジェクトを同時に選択することができます。

オブジェクトは，キーボード操作で選択することもできます。

* ``control (command)``+``A``: すべてを選択

### 四角ツール

範囲指定で四角オブジェクトを描画します。``shift``キーを押しながら四角オブジェクトを描画すると，正方形が作られます。``shift``キーを押しながら四角オブジェクトをリサイズすると，長方形が正方形に変化します。

### 円ツール

範囲指定で円オブジェクトを描画します。``shift``キーを押しながら円オブジェクトを描画すると，楕円の代わりに円が作られます。``shift``キーを押しながら円オブジェクトをリサイズすると，楕円が円に変化します。

四角・円の属性を変更するには，右クリックしてコンテキストメニューから項目を選択します。

* 色 > 背景色 | 描画色
* 背景色透明度
* 描画色透明度
* 線幅

### 線ツール

範囲指定で直線オブジェクトを描画します。``shift``キーを押しながら直線オブジェクトを描画すると，``45``度の斜め線あるいは水平・垂直な線が作られます。``shift``キーを押しながら直線オブジェクトをリサイズすると，線が正方形の範囲を横切る``45``度の斜め線に変化します。

### 自由線ツール

移動操作で自由線オブジェクトを描画します。``shift``キーを押しながら自由線オブジェクトを描画すると，描画を開始した位置，あるいは最後に``shift``キーを離した位置から現在の位置までが直線になります。``shift``キーを押しながら自由線オブジェクトをリサイズすると，アスペクト比を維持したリサイズに変化します。

線・自由線の属性を変更するには，右クリックしてコンテキストメニューから項目を選択します。

* 色 > 背景色 | 描画色
* 背景色透明度
* 描画色透明度
* 線幅
* 矢印 > 終端 | 始端 | 両端 | なし

### テキストツール

範囲指定でテキストオブジェクトを描画します。``shift``キーを押しながらテキストオブジェクトを描画すると，正方形のオブジェクトが作られます。``shift``キーを押しながらテキストオブジェクトをリサイズすると，長方形のオブジェクトが正方形に変化します。

**カスタマイズ**: デフォルトで表示される文字列は変更することができます。ソースコード内の``Editor_SET_DEFAULT_TEXT``を参照してください。

テキストを編集するには，``control (command)``キーを押しながらテキストオブジェクトをクリックするか，テキストオブジェクトをダブルクリックします。

テキストの属性を変更するには，テキストが編集中ではない状態で右クリックしてコンテキストメニューから項目を選択します。

* 色 > 背景色 | 描画色
* 背景色透明度
* 描画色透明度
* 線幅
* フォント
* フォントサイズ
* 横整列 > 左揃え | 中央揃え | 右揃え
* 縦整列 > 上揃え | 中央揃え | 下揃え
* スタイル > イタリック | ボールド | アンダーライン
* テキストオプション > 折り返し > する | しない

**注記**: フォントファミリーの中には，特定のスタイルをサポートしていないものもあります（特にイタリック体）。

スタイルは，キーボード操作でも変更することができます。

* ``control (command)``+``I``: イタリック
* ``control (command)``+``B``: ボールド
* ``control (command)``+``U``: アンダーライン

### ペーストおよびドロップアクション

エディターは下記のテキストデータを受け入れます。

* ``com.4d.svg-editor.objects``

* ``public.utf8-plain-text``

* ``public.utf16-plain-text``

* ``public.utf16-external-plain-text``

**注記**: エディター上でコピーまたはカットされたオブジェクトは，XML形式でペーストボードに転写されています。エディターにペーストされたテキストが下記の条件を満たしている場合，そのデータはエディター上のオブジェクトとしてペーストされます。その他のテキストがペーストまたはドロップされた場合，マウスポインターの位置に新しいテキストオブジェクトが作成されます。

* ``xml``ドキュメント
* ルートオブジェクトの要素名が``editor:editor``

### イメージ

画像はコピーあるいはファイルのドロップ操作で追加することができます。

---

## プログラミングの操作

下記のプロジェクトメソッドは「共有」設定が有効にされており，ホスト側のアプリケーションから呼び出すことができます。

* ``NEditor_SET_ZOOM``
* ``NEditor_Get_zoom``
* ``NEditor_SET_ROTATE``
* ``NEditor_Get_rotate``
* ``NEditor_SET_IMAGE``
* ``NEditor_Get_image``

**注記**: 以下のプロジェクトメソッドは内部的な制御のために「共有」設定が有効にされていますが，フォームメソッド・オブジェクトメソッド以外の場面において単独で使用されることは想定されていません。

* ``NEditor_Form_event``

```
NEditor_SET_ZOOM (area;zoom)
zoom:=NEditor_Get_zoom (area)
```

Parameter|Type|Description
------------|------------|----
area|TEXT|エディターのオブジェクト名
zoom|REAL|倍率（標準: ``1``）

```
NEditor_SET_ROTATE (area;rotate)
rotate:=NEditor_Get_rotate (area)
```

Parameter|Type|Description
------------|------------|----
area|TEXT|エディターのオブジェクト名
rotate|REAL|角度（標準: ``0``）

```
NEditor_SET_IMAGE (area;image)
image:=NEditor_Get_image (area{;removeAnnotation})
```

Parameter|Type|Description
------------|------------|----
area|TEXT|エディターのオブジェクト名
image|PICTURE|ドキュメント
mode|LONGINT|書き出しモード

* 書き出しモード

``0``

画像は，``SVG``にエディター固有の情報（``editor``名前空間）が埋め込まれたものが返されます。ピクチャなので，そのままフィールドに表示したり，データベースに保存することができます。また，エディターで画像を開いて編集を継続することができます。


``1``

画像は，``SVG``にエディター固有の情報（``editor``名前空間）が埋め込まれたものが返されますが，``0``とはいくつかの点が異なっています。

* エディター上の選択状態は解除されています。
* 元画像が元のサイズで収まる四角形でエクスポートされます。

``WRITE PICTURE FILE``や``CONVERT PICTURE``で一般的な``PNG``形式などに変換することを想定しています。

``2``

元画像だけを取り出します。

インポートの例題

```
If (Form event=On Clicked)

  $path:=System folder(Desktop)+"test.svg"
  $formats:=".svg;.png;.jpg;.gif;.bmp;.tif;"+Choose(Folder separator=":";".pdf;.exr;";".emf;.xps;")
  $fileName:=Select document($path;$formats;"";Package open)

  If (OK=1)
    C_PICTURE($image)
    READ PICTURE FILE(DOCUMENT;$image)
    NEditor_SET_IMAGE ("Editor";$image)
  End if 

End if 
```

エクスポートの例題

```
If (Form event=On Clicked)

  $path:=System folder(Desktop)
  $formats:=".png;.jpg;.gif;.bmp;.tif;"+Choose(Folder separator=":";".pdf;.exr;";".emf;.xps;")
  $fileName:=Select document($path;$formats;"";Package open|File name entry)

  If (OK=1)
    $image:=NEditor_Get_image ("Editor")
    WRITE PICTURE FILE(DOCUMENT;$image)
    OPEN WEB URL(DOCUMENT)
  End if 

End if 
```
