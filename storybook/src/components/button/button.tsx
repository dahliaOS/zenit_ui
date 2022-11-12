import { Component, Prop, h, Host } from '@stencil/core';

@Component({
  tag: 'zenit-button',
  styleUrl: 'button.scss',
  shadow: true,
})
export class Button {
  //element: HTMLButtonElement;

  /**
   * Whether to use primary styling for this button.
   */
  @Prop() primary: boolean;

  /**
   * Whether the button should not be clickable.
   */
  @Prop() disabled: boolean;

  render() {
    return <Host>
      <button
        class={[
          this.primary ? 'zenit-primary' : ''
        ].join(' ')}
        disabled={this.disabled}
      //ref={(el) => this.element = el}
      ><slot /></button>
    </Host>;
  }
}
