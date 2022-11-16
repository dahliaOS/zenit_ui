import { Component, Prop, h, Host, Listen, Element } from '@stencil/core';

@Component({
  tag: 'zenit-textbox',
  styleUrl: 'textbox.scss',
  shadow: true,
})
export class Textbox {
  @Element() host: HTMLZenitTextboxElement;

  /** Label for the input */
  @Prop() label?: string;
  /** Placeholder for the input */
  @Prop() placeholder: string;
  /** Value for the input */
  @Prop({ reflect: true }) value: string;
  /** Type for the input */
  @Prop() type: 'text' | 'password' | 'search' | 'url' | 'email' | 'tel' = 'text';
  /** Whether the input is disabled */
  @Prop() disabled: boolean;
  /** Whether the input is required */
  @Prop() required: boolean;

  @Listen("input", { capture: true })
  inputCaptureEvent(e: InputEvent) {
    this.value = (e.target as HTMLInputElement).value;
  }

  render() {
    return (
      <Host>
        <label class="--container" data-disabled={this.disabled} data-required={this.required}>
          {this.label ? <span class="--label">{this.label}</span> : null}
          <div class="--row">
            <slot name="prefix" />
            <input
              class="--input"
              type={this.type}
              placeholder={this.placeholder}
              value={this.value}
              disabled={this.disabled}
              required={this.required}
              {...this.host.attributes}
            />
            <slot name="suffix" />
          </div>
          {/* <slot name="error" /> */}
        </label>
      </Host>
    );
  }
}