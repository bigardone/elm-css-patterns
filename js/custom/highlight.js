import hljs from 'highlight.js';
import elm from 'highlight.js/lib/languages/elm';
import 'highlight.js/styles/nord.css';

hljs.registerLanguage('elm', elm);

export default class Highlight extends HTMLElement {
  constructor() { super(); }

  static get observedAttributes() {
    return ['content'];
  }

  connectedCallback() {
    const content = this.getAttribute('content');

    const pre = document.createElement('pre');
    const code = document.createElement('code', { class: 'language-elm' });
    code.innerHTML = content;

    pre.appendChild(code);
    this.appendChild(pre);
    hljs.highlightBlock(code);
  }
}

if (!customElements.get('c-highlight')) {
  customElements.define('c-highlight', Highlight);
}
