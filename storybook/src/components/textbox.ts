import { LitElement } from "lit";

@customElement('zenit-textbox')
export default class Textbox extends LitElement {
    @property({type: String})
    placeholder: string = "";
}

declare global {
    interface HTMLElementTagNameMap {
      "zenit-textbox": Textbox;
    }
}