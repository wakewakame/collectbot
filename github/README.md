# 投稿した全リポジトリをcloneする

## 1. 全リポジトリのURLをgithub/list.txtに書く

- ToDo: 複数ページあるときの対応

`https://github.com/<userId>?page=1&tab=repositories` にアクセスし、以下を実行する。

```javascript
const nodes = document.querySelectorAll("#user-repositories-list .wb-break-all>a");
const links = Array.from(nodes)
  .map(elem => elem.href);
console.log(links.join("\n"));
```

リポジトリの一覧が表示されるので、それをコピーしてgithub/list.txtに保存する。

## 2. 全部cloneする or 全部pullする

```bash
./clone.sh
```

完了するとrepos.tarが生成される。

