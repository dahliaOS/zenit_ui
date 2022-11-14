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
   * Whether to use transparent/tertiary styling for this button.
   */
  @Prop() transparent: boolean;

  /**
   * Whether to display the button as a rounded rectangle
   * instead of a pill.
   */
  @Prop() rounded: boolean;

  /**
   * Whether the button should have a 1:1 aspect ratio.
   * This is useful for icon buttons.
   */
  @Prop() icon: boolean;

  /**
   * Whether the button should not be clickable.
   */
  @Prop() disabled: boolean;

  render() {
    return <Host>
      <button
        class={[
          this.transparent ? 'zenit-tertiary'
            : this.primary ? 'zenit-primary' : '',
          this.rounded ? 'zenit-rounded' : '',
          this.icon ? 'zenit-square' : '',
        ].join(' ')}
        disabled={this.disabled}
      //ref={(el) => this.element = el}
      ><slot /></button>
    </Host>;
  }
}
