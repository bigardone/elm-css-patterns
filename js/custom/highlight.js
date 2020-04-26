import '@webcomponents/custom-elements';
import Prism from 'prismjs';
import 'prismjs/components/prism-elm';
import '../../css/prism-nord.css';


export default class Highlight extends HTMLElement {
  constructor() { super(); }

  static get observedAttributes() {
    return ['content'];
  }

  connectedCallback() {
    const content = this.getAttribute('content');

    const pre = document.createElement('pre');
    const code = document.createElement('code');
    code.setAttribute('class', 'language-elm');
    code.innerHTML = content;

    pre.appendChild(code);
    this.appendChild(pre);

    Prism.highlightAll();
  }
}

if (!customElements.get('c-highlight')) {
  customElements.define('c-highlight', Highlight);
}
