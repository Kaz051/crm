const buildHTML = (XHR) => {
  const item = XHR.response.post;
  const html = `
    <p>
      <a href= "/users/${item.user_id}" data-remote="true">${item.user_name}</a>：
      ${item.created_at}：
      ${item.text}
    </p>`;
  return html;
};

function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
};
 
 window.addEventListener('load', post);